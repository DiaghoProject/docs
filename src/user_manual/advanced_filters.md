# Filtres avancés

Les filtres avancés sont des requêtes conçues par les utilisateurs pour permettre un
filtrage libre des variations. Si les
[filtres rapides](/opensource_docs/bioinformatics/quickfilters.md) sont des filtres
pré-configurés permettant d'être appliqués en quelques clics pour affiner davantage les
variations affichées dans un tableau, le gros du filtrage dans l'application sera
effectué directement ou non par des filtres avancés.

Étant complètement libres, ils peuvent être aussi stringents ou laxistes que le souhaite
l'utilisateur et adaptables au contexte d'une interprétation (ex: on ne filtrera pas de
la même manière une interprétation dans le cadre d'une DI non spécifique que pour une
mononucléose).

!!! success "Feuille de route"

    - [x] Possibilité d'appliquer des filtres avancés à une interprétation
     · [Détails](#filtres-avancés) ·
     [Core PR 384](https://github.com/DiaghoProject/diagho-core/pull/384)
    - [x] Possibilité d'enregistrer un filtre avancé pour une réapplication ultérieure
    · [Détails](#enregistrement-des-filtres-avancés) ·
    [Core PR 416](https://github.com/DiaghoProject/diagho-core/pull/416),
    [Front PR 140](https://github.com/DiaghoProject/diagho-front/pull/140)
    - [x] Possibilité d'appliquer un filtre avancé enregistré précédemment
    · [Détails](#enregistrement-des-filtres-avancés)
    · [Front PR 140](https://github.com/DiaghoProject/diagho-front/pull/140)
    - [x] Possibilité d'ajouter automatiquement un tag aux variations passant un filtre
    avancé lors d'une interprétation
    · [Détails](#application-automatique-de-tags)
    · [#548](https://github.com/DiaghoProject/diagho-core/issues/548),
    [Front PR 140](https://github.com/DiaghoProject/diagho-front/pull/140)
    - [ ] Possibilité de choisir une liste de filtres avancés et de tags avant le
    calcul d'une interprétation · [Détails](#pré-calcul-de-filtres-complexes)
    · [#603](https://github.com/DiaghoProject/diagho-core/issues/603)
    - [ ] Possibilité de configurer un projet pour pré-remplir une liste de filtres
    avancés aux interprétations en son sein
    · [Détails](#configuration-dun-pré-calcul-par-défaut-par-projet)
    · [008B09](https://github.com/orgs/DiaghoProject/projects/5/views/1?pane=issue&itemId=32323189)
    #### Ultérieurement
    - [ ] Interface dédiée à la création de filtres complexes
    - [ ] Versionning, description et gestion du partage des filtres complexes enregistrés
    - [ ] Catalogue de filtres pour profiter des expertises externes

## Filtres avancés
<!-- markdownlint-disable-next-line -->
[![Exemple de menu de filtres rapides](/images/202308advancedfiltersform_detailed.png){ align=right width=360 }](/images/202308advancedfiltersform_detailed.png)

Un filtre avancé doit permettre à l'utilisateur d'appliquer un filtrage totalement libre
à ses interprétations, tant sur sa stringence, le nombre de critères et leur
organisation logique.

- Il est composé d'un ou plusieurs critère consistant en une colonne, un opérateur et
  une valeur (ex: `gnomad_AF < 0.01`)
- Ces critères sont organisés par des opérateurs booléens AND, OR, XOR, NOT (ex:
  `gnomad_AF < 0.01 AND (FILTERS contains "PASS" OR DP > 40)`)
- Dans le cadre d'une interprétation, son application entraîne l'actualisation du
  tableau pour afficher les variations correspondantes

## Enregistrement des filtres avancés

Les filtres avancés pouvant rapidement devenir complexes, fastidieux à configurer et
étant parfois fréquemment réutilisés, il est nécessaire d'offrir la possibilité
d'enregistrer un filtre avancé pour une réutilisation ultérieure.

### Exigences

- Possibilité de nommer et d'enregistrer un filtre complexe pour une réutilisation
  ultérieure
- Dans le cadre d'une interprétation, possibilité de récupérer un filtre complexe
  enregistré pour pré-remplir facilement le formulaire de filtres avancés

### Contraintes

- Le nom du filtre doit être unique

## Application automatique de tags

Fondamentalement, le but d'un filtre est de faire remonter des variations ayant plus ou
moins de critères en commun (ex: variations rares, variations notées pathogènes dans
ClinVar, variations apparemment de novo…). L'application automatique d'un tag aux
variations répondant à un filtre avancé permettra :

1. d'offrir à l'utilisateur une couche d'abstraction sur les filtres complexes
   (possibilité d'en profiter sans avoir à les configurer soi-même)
2. de retrouver facilement les résultats de différents filtrages successifs sans avoir à
   reconfigurer lesdits filtres
3. de savoir lorsqu'une variation répond simultanément à plusieurs filtres avancés (ex:
   `"de novo" + "patho/likely patho"`)

### Exigences

- Possibilité d'ajouter un tag aux variations répondant à un filtre avancé
- Ne pas appliquer de doublon lorsqu'une variation répond à un même tag appliqué par
- deux filtres différents (ex: `tags = ["A", "B", "A"]` doit être impossible)

## Pré-calcul de filtres complexes

Afin d'éviter à l'utilisateur de devoir appliquer manuellement la suite de mêmes filtres
et tags avant de pouvoir commencer leurs interprétations, il doit être possible de
spécifier avant le calcul de ces dernières une liste de filtres complexes enregistrés et
de tags associés à appliquer dès la création de l'interprétation. Ainsi, lorsque
l'utilisateur ouvrira ladite interprétation pour la première fois, ses variations auront
déjà été tagguées comme attendu, permettant de débuter directement la fouille sans avoir
même à passer par le formulaire de filtre complexe.

### Exigences

- Possibilité lors de la création d'une interprétation de spécifier un dictionnaire de
  filtres complexes enregistrés et de tags à appliquer pour chaque filtre dans un
  attribut `prefiltering`.

  !!! exemple

  1. Filtre **XLR** de user1 → appliquer tag **XLR**
  2. Filtre **Clinvar patho** de user2 → appliquer tag **ACMG4/5**
  3. Filtre **De novo** de user1 → appliquer tag **de novo**
  4. Filtre **Var de novo** de user3 → appliquer tag **de novo**

- Variations correctement tagguées lorsque l'interprétation a fini d'être calculée

## Configuration d'un pré-calcul par défaut par projet

En routine et dans le cadre d'un contexte diagnostique donné, les mêmes filtres de base
sont quasi systématiquement réutilisés. C'est l'une des raisons d'être des
[projets](./projects.md). Pour éviter à l'utilisateur de renseigner la même liste de
filtres à chaque nouvelle interprétation, une liste de filtres et tags à appliquer par
défaut peut être spécifiée au niveau du projet pour que chaque nouvelle interprétation
créée en son sein hérite de ce `prefiltering`.

Cette liste par défaut n'est cependant qu'une pré-complétion du formulaire de création
d'interprétation et doit pouvoir être outrepassée ou complétée si l'utilisateur le
souhaite comme spécifié dans le
[chapitre précédent](#pr%C3%A9-calcul-de-filtres-complexes).

Si aucune liste n'est renseignée dans le projet, le `prefiltering` des interprétations
associées à ce projet reste vierge par défaut.

Les sous-projets n'héritent pas de cette configuration.

- Configuration possible d'un `default_prefiltering` au niveau des projets
- \[FRONT\] Complétion automatique du champ `prefiltering` du formulaire de création
  d'interprétation lors du choix du projet parent
- Possibilité de modifier ce champ `prefiltering` pré-rempli avant le lancement du
  calcul d'interprétation (ajout de filtre, retrait de filtre, renommage de tag)
