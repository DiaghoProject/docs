# Fonctionnalités générales

> Plus de confort pour les généticiens biologistes, simplification de la chaîne
> d'activités métier, augmentation du nombre de familles bénéficiant d'un diagnostic et
> ce dans des délais réduits, voilà l'objectif fondamental de Diago.

L'application Diagho a pour objectif fondamental à partir d'un fichier en entrée listant
toutes les variations génétiques d'un malade et de sa famille de générer un tableau
listant ces variations enrichies d'**annotations** supplémentaires.

Si chaque variation est une ligne du tableau, chaque annotation en est une colonne.  
Ces annotations permettent l'application de filtres rendant ledit tableau exploitable
par un humain afin qu'il puisse y trouver la variation responsable de la maladie.

[![Maquette tableau](/images/mockup/filter.jpg)](/images/mockup/filter.jpg)

## Fonctionnalités générales

??? quote "Tableau d'interprétation de données génomiques" - Application de filtres
ensemblistes et de tri - Aides à la fouille : accès simplifié à des DB externes,
visualisations, mise en avant de données potentiellement pertinentes… - Personnalisation
de l'IU : choix de l'ordre et de l'affichage ou non des colonnes, persistance des
règlages… - Ajout d'informations/classifications personnelles aux variations - Gestion
simultanée de différents types de données : SNV/Indel et CNV[^1]

??? quote "Gestion de dossiers patients" - Gestion des relations interpersonnelles
(liens familiaux…) - Ajout de données complémentaires : phénotypes, âge, résultats
d'imagerie… - Historique, traçabilité

??? quote "Gestion de contrôles qualité (QC)" - Rapports QC associés aux analyses -
Rapports QC associés aux batchs de séquençage - Calcul de QC supplémentaires - Suivi,
traçabilité pour audit qualité

??? quote "Génération de rapports d'interprétation" - Variations retenues en
interprétation enrichies d'informations complémentaires : commentaires du lecteur,
publications associées, screenshots… - Pré-complétion classification ACMG - Exports
divers : tableur, doc, pdf… - Interfaçage SGL locaux à envisager

??? quote "Enrichissement database locale" - Comptage de variations rencontrées -
Partage des commentaires d'autres praticiens

??? quote "Intégration de pipelines bioinformatiques" - Couche d'abstraction pour la
gestion de pipelines bioinformatiques - Partage de configuration simplifié entre
laboratoires - Traçabilité par le versionnement

<figure>
    <img src="/images/simplified_pres.jpg"> 
    <figcaption>Fonctionnement v1 simplifié</figcaption>
</figure>

## L'interprétation

L'interprétation étant le cœur de l'application, [une page dédiée](./interpretation.md)
précise davantage son déroulement et quelques leviers d'action de Diagho sur le sujet.

## Concept généraux dans Diagho

| Terme                         | Définition                                                                                                                              |
| ----------------------------- | --------------------------------------------------------------------------------------------------------------------------------------- |
| **Sample**                    | Données issues d'un VCF pour un individu                                                                                                |
| **Personne/individu**         | Personne physique à qui est liée un ou plusieurs samples                                                                                |
| **Famille**                   | Regroupement d'individus apparentés                                                                                                     |
| **Analyse (bioinformatique)** | Traitement d'un ou plusieurs samples pour les rendre interprétables (annotation si nécessaire, calculs QC, pré-calcul de filtres…)      |
| **Projet**                    | Contexte de lancement d'une analyse permettant de classer ces dernières et de standardiser les annotations et filtres pré-calculés      |
| **Annotation**                | Information complémentaire apportée à une variation, objective ou dans un contexte donné (gène d'appartenance, est de novo…)            |
| **Factory**                   | Module d'annotation pour une base de données donnée                                                                                     |
| **Filtre**                    | Discrimination de variations sur la base d'une ou plusieurs annotations                                                                 |
| **Interprétation**            | Exploration/manipulation par un humain du résultat d'une analyse, typiquement dans le but de trouver la variation causale d'une maladie |

Un glossaire est disponible à [ce lien](/ressources/glossary)

[^1]: cf les différents [types de variations](./variants.md)
