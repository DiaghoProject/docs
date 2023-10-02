# Interprétation

Elle se décompose en plusieurs étapes accessibles par des onglets situés dans le header
de la page.

- [Général](#general)
- [QC](#qc)
- [Tableau d'interprétation](#ecran-interpretation)
- [Confirmation](#confirmation)

## Général {#general}

!!! attention À préciser

Cet écran réunit les informations générales concernant l'analyse (nombre d'individus
analysés, liens familiaux, génome de référence, résumé du séquençage, relatedness...).

## QC {#qc}

!!! attention À préciser

Cet écran réunit les informations permettant d'estimer la qualité du séquençage (ratio
TsTv, profondeur moyenne, hétérozygotie, distribution dans le caryotype...).

## Tableau d'interprétation {#ecran-interpretation}

### Composants

Cet écran est constitué de plusieurs composants principaux :

- [Le menu de filtrage](#chap-filtermenu)
- [La visualisation du graphe](#chap-filtergraphe)
- [Le tableau d'interprétation](#chap-vartable)

### Menu de filtrage {#chap-filtermenu}

- **Afficher les variations flag par l'utilisateur** : "variations d'intérêt",
  "variations à étudier", "variations non pertinentes", autres tags manuels ou
  automatiques.
- **Appliquer des filtres rapides** : permet d'ajouter un filtre temporaire au nœud du
  graphe actuellement actif (_e.g. de novo, exonic, frameshift, AF \< 0.001,..._).
- **Ajouter des nœuds** : permet d'ajouter un nœud à une branche du graphe pour y
  ajouter une étape de filtrage ou des annotations. Si un nouveau filtre appliqué dépend
  d'une annotation absente, il sera automatiquement précédé par l'étape d'annotation
  adéquate. Un filtre complexe offre des options avancées comme l'ajout automatique d'un
  tag aux variations passant le nœud.
- **Appliquer un filtrage enregistré** : liste de filtrages enregistrés par
  l'utilisateur à appliquer à la place ou en complément du graphe actuellement utilisé.
- Peut être masqué pour libérer de la largeur à l'écran.

### Visualisation du graphe {#chap-filtergraphe}

- Cadre permettant une représentation graphique du filtrage appliqué à l'analyse. Chaque
  nœud le composant correspond à une étape d'annotation ou à un filtre complexe.<br>
  Dans le cas d'un filtre, le nœud affiche le nom du filtre complexe si précisé, le
  nombre de variations passant ses critères et les tags appliqués automatiquement le cas
  échéant.
- Survoler un nœud affichera un détail des filtres ou annotations appliquées.
- Sélectionner un nœud affichera dans le tableau d'interprétation les variations passant
  ledit nœud.
- Il est possible de modifier les valeurs appliquées aux différents nœuds ; la
  confirmation de ces modifications entraînera un recalcul.
- Peut être masqué pour libérer de la hauteur à l'écran.

### Tableau d'interprétation {#chap-vartable}

La tableau d'interprétation où seront affichées les données incluses dans l'analyse.
Composé de :

- Des onglets permettent d'alterner entre les différents types de données analysées
  (_e.g. SNV, CNV, ADN mitochondrial..._).
- Une barre d'outils permettant :
  - flag une variation "d'intérêt", "à étudier" ou "non pertinentes"
  - ajouter une note pense-bête
  - ajouter un tag
  - rechercher dans le tableau
  - réinitialiser l'affichage du tableau
  - personnaliser les colonnes affichées et la pagination
  - exporter les données
- Les colonnes du tableau sont redimensionnables et réorganisables. Leurs entêtes
  permettent de modifier l'affichage des variations dans le tableau (_e.g. trier par
  classes ACMG décroissantes, nom du gène contient "BRC",..._).<br> Des colonnes peuvent
  être verrouillées au choix de l'utilisateur pour être toujours visibles à l'écran
  lorsque celui-ci fait défiler le tableau horizontalement.
- Les lignes du tableau commencent par une checkbox permettant de faire une sélection
  multiple de variations.<br> Leur contenu dépendra du type de données et des
  annotations appliquées par l'utilisateur.<br> Elles se terminent par un bouton à
  droite, toujours visible, qui, lorsque survolé, permet d'afficher dans une infobulle
  le contenu des colonnes hors cadre à droite.<br> Lorsqu'une variation est
  sélectionnée, un accordéon se déplie pour afficher la liste des transcrits concernés.

## Confirmation {#confirmation}

Écran permettant la confirmation par le généticien des variations marquées d'intérêt ou
d'un diagnostic nul. Il permet de - relire les détails des variations sélectionnées pour
faire une dernière vérification

- d'y ajouter des remarques personnelles
- d'y joindre des publications et des screenshots de genome browsers.

Le généticien peut également joindre une note à une variation ou un gène à ajouter à la
base de données commune, son identité restant liée à cette note pour pouvoir être
éventuellement recontacté par un collègue rencontrant un cas similaire.

Une fois confirmée le statut de l'interprétation est mis à jour. Le lecteur peut choisir
de garder le résultat de son interprétation secret jusqu'à la validation en RCP à partir
de laquelle il deviendra disponible aux autres utilisateurs ayant accès au projet.

Le contenu de cette confirmation peut être utilisé pour générer un compte-rendu ou un
rapport d'interprétation à présenter en RCP exportable par l'utilisateur au format de
son choix (.docx, .pdf, .ppt,...).

!!! attention 
  Un **compte-rendu** ne contiendra pas nécessairement toutes les variations
  et informations utilisées pour un **rapport d'interprétation**.
