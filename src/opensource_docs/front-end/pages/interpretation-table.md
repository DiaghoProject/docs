# Tableau d'interprétation

## Mockup

Un tableau dynamique avait été créé pour faire aux utilisateurs une présentation
dynamique des fonctionnalités de base prévues pour le tableau.

!!! attention Cette version fonctionne sans back. Certaines actions montrées n'ont pas
lieu d'être manuelles dans le cadre de l'application.

<div style="width:100%;height:0px;position:relative;padding-bottom:56.250%;"><iframe src="https://streamable.com/e/c27265?loop=0" frameborder="0" width="100%" height="100%" allowfullscreen style="width:100%;height:100%;position:absolute;left:0px;top:0px;overflow:hidden;"></iframe></div>

## Composants

Cet écran est constitué de plusieurs composants principaux :

- [Tableau d'interprétation](#tableau-dinterprétation)
  - [Mockup](#mockup)
  - [Composants](#composants)
    - [Menu de filtrage {#chap-filtermenu}](#menu-de-filtrage-chap-filtermenu)
    - [Visualisation du graphe {#chap-filtergraphe}](#visualisation-du-graphe-chap-filtergraphe)
    - [Tableau d'interprétation {#chap-vartable}](#tableau-dinterprétation-chap-vartable)

### Menu de filtrage {#chap-filtermenu}

???+ abstract "TL;DR" === "En résumé" Un menu latéral pour filtrer les variations
affichées dans le tableau

    === "Maquette"
        [![Menu de filtrage](/images/mockup/filter.jpg){ loading=lazy }](/images/mockup/filter.jpg)

- **Afficher les variations flag par l'utilisateur** : "variations d'intérêt",
  "variations à étudier", "variations non pertinentes", autres tags manuels ou
  automatiques.
- **Appliquer des filtres rapides** : permet d'ajouter un filtre temporaire au nœud du
  graphe actuellement actif (_e.g. de novo, exonic, frameshift, AF < 0.001,..._).
- **Ajouter des nœuds** : permet d'ajouter un nœud à une branche du graphe pour y
  ajouter une étape de filtrage ou des annotations. Si un nouveau filtre appliqué dépend
  d'une annotation absente, il sera automatiquement précédé par l'étape d'annotation
  adéquate. Un filtre complexe offre des options avancées comme l'ajout automatique d'un
  tag aux variations passant le nœud.
- **Appliquer un filtrage enregistré** : liste de filtrages enregistrés par
  l'utilisateur à appliquer à la place ou en complément du graphe actuellement utilisé.
- Peut être masqué pour libérer de la largeur à l'écran.

### Visualisation du graphe {#chap-filtergraphe}

???+ abstract "TL;DR" === "En résumé" Une réprésentation graphique des étapes de
filtrage appliquées

    === "Exemple Alissa"
        [![Graphe de filtres Alissa](/images/mockup/alissa-filters.jpg){ loading=lazy }](/images/mockup/alissa-filters.jpg)

!!! note Ce composant est d'une priorité faible et non nécessaire pour un MVP

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

???+ abstract "TL;DR" === "En résumé" Macro-composant contenant le tableau listant les
variations et permettant à l'utilisateur d'agir dessus (catégorisation, commentaire…)

    === "Actions"
        [![Barre d'outils interprétation](/images/mockup/interpretation-actions.jpg){ loading=lazy }](/images/mockup/interpretation-actions.jpg)

    === "Accordéon transcrits"
        [![Accordéon transcrits](/images/mockup/interpretation-accordeon.jpg){ loading=lazy }](/images/mockup/interpretation-accordeon.jpg)

La tableau d'interprétation où seront affichées les données incluses dans l'analyse.
Composé de :

- Des onglets permettent d'alterner entre les différents types de données analysées
  (_e.g. SNV, CNV, ADN mitochondrial..._).
- Une barre d'outils permettant :
  - flag une variation "d'intérêt" ou "non pertinentes"
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
