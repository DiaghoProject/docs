# Mettre en place une analyse

Pour l'instant la création des analyses se fait dans l'admin

!!! note A Réorganiser !!!

## Chargement des factories

Lancer les 2 workers

```bash
$ make worker-gateway
$ make worker-computation
```

Dans l'admin, choisir une factory et sélectionner `Load factory`

En fonction de la factory, cela va peupler la base de données avec des objets.

Si tout s'est bien déroulé, le `state` sera `SUCCESS`

## Chargement du VCF

Dans l'admin, sélectionner l'objet Sequencings, ajouter le VCF en PJ et lance
`load sequencing`

- Récupération ou Création des `Variant`
- Récupération ou Création des `Sample`
- Création des `SampleRecord`

Faire correspondre les `Sample` créés (si il y en a) avec des patients

## Création de l'analyse

Lors de la création de l'analyse, on va déterminer les différentes annotations et les
différents filtres à appliquer sur le patient et les samples associés. -> Création des
`AnalysedSample` (M2M entre `Analysis` et `Sample`)

1- Load Samples

Pour chaque analyse, on va appeler la fonction `load_samples` qui va lancer la tâche
`analysis_load_samples_by_region` en async pour chaque `Region`

-> Cela va créer des `AnalysisRecord` (`M2M entre Analysis et Variant`) et des
`AnalysedSampleRecord` (M2M entre `AnalysisRecord` et `SampleRecord`) ->
`build_metadata` pour les `AnalysisRecord` récupérés ou créés

2- Build Steps

Il y a 2 types de steps, les `AnnotationStep` et les `FilterStep`

Pour les `AnnotationStep`:

On `load()` en async chaque step, on check s'il y a un parent

```text
i oui, on raise une erreur `step.NotReady` et on retry jusqu'à ce que le step parent soit
prêt

Sinon on lance `process()`
```

Cela va déclencer le chargement en chaine (Celery) des fontions suivantes

A- annotation_step_build_node_records

Pour la fonction `annotation_step_build_node_records`

```text
i il y a un parent on récupère les `AnalysisRecord` du step parent

Sinon les `AnalysisRecord` du step actuel
```

Pour tous ces `AnalysisRecord` et si le `NodeVariantFlag` est prêt on va créer ou
récupérer des `NodeVariantFlag`, si on vient de le créer on va appeler la fonction
`build_records` qui va appeler en chaine (celery) les fonctions suivantes:

a - node_variant_flag_build_parent_node_records

```text
i pas de parent on ne fait rien

Sinon on récupère ou on créé le `NodeVariantFlag` parent
```

Pour tous les `NodeVariantFlag` parents créés on va lancer la fonction `build_records`

b - node_variant_flag_build_primary_node_records

```text
n va récupérer les `primary_objects` pour chaque factory et on va créer des `NodeRecord`
à partir d'un `Variant`
```

c - node_variant_flag_build_secondary_node_records

```text
n va récupérer les `secondary_objects` pour chaque factory et on va créer des `NodeRecord`
à partir d'un `parent_node_record`
```

B- annotation_step_load_primary_node_records

```text
i il y a un parent on récupère les `AnalysisRecord` du step parent

Sinon les `AnalysisRecord` du step actuel

Pour tous ces `AnalysisRecord` on va récupérer les `NodeRecord` associés au node du step et au variant

-> Création du `StepRecord`
-> Création du `StepNodeRecord` (M2M entre le StepRecord et le NodeRecord)
```

C- annotation_step_load_secondary_node_records

```text
i il n'y a pas de parent on return

On récupère les `StepRecord` du parent

Pour les `StepRecord` du parent, on va récupérer le `AnalysisRecord` associé

Pour tous ces `StepRecord` on récupére les secondary_node_records

Si il y a des secondary_node_record:

    Pour tous les secondary_node_record récupérés

    -> Création des `StepRecord` associés

    Pour tous les `StepRecord` que l'on récupère chez le parent, on va récupérer les `NodeRecords` associés et ajoutés les informations du secondary_node_record
    -> Cela va créer des StepRecord avec plusieurs StepNodeRecord associés (celui du parent et celui du step actuel)

Sinon:
    On recréé les `StepRecord` du parent
```

Pour les `FilterStep`:

On `load()` en async chaque step, on check s'il y a un parent

```text
On supprime les `StepRecord` du step (si il y en a)

On récupère les objects `conjunctions` et `disjunctions` et on construit les
variables `q_NOT_AND` et `q_AND`

Si il y a des parents
    On récupère les `StepRecord`, on les filtres avec `q_AND` et on exclus avec `q_NOT_AND` et on recréé les `StepRecord` et les `StepNodeRecord`

Sinon on récupère les `AnalysisRecord` et on recréé les `StepRecord` par batch en appliquant les filtres `q_AND` et `q_NOT_AND`
```
