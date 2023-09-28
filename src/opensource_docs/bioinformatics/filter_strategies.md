# Stratégies de filtrage
Quelques exemples de filtres utilisés par différents LBM

## Filtres Nantes
[![Filtres Nantes](/images/filters_nantes.png)](/images/filters_nantes.png)

## Filtres Rennes
[![Filtres Rennes](/images/filters_rennes.png)](/images/filters_rennes.png)

## Filtres DDD
[![Filtres DDD 2014](/images/ddd.jpg)](/images/ddd.jpg)

## Filtres réanalyse DDD
A permis un gain diagnostique de 13% sur moins de 4 ans pour environ 0,7 variation remontée par cas index.  
69% de ce gain diagnostique a été permis par une avancée des connaissances et 23% par une amélioration des analyses (annotations actualisées et filtrage affiné).

Le script de filtrage actualisé est [disponible ici](https://github.com/jeremymcrae/clinical-filter).  
La détection des variations *de novo* est assurée par un outil tiers, [DeNovoGear](https://github.com/ultimatesource/denovogear), et seules les variations avec une `PP_DNM > 0.9` sont retenues.

[![Filtres réanalyse DDD](/images/dddrean.png)](/images/dddrean.png)

## Génotypes particuliers  

### de novo
!!! warning "Attention"
    Ce découpage est une version naïve et ne saurait être suffisant pour qualifier une variation de *de novo*, les explications de ces GT pouvant être en réalité assez divers.

Pour les autosomes :  

- Enfant = 0/1, Mère = 0/0 + Père = 0/0
- Enfant = 1/1, Mère = 0/0 + Père = 0/1
- Enfant = 1/1, Mère = 0/1 + Père = 0/0
- Enfant = 1/1, Mère = 0/0 + Père = 0/0

Pour l'X si l'enfant est un garçon :  

- Garçon = 1, Mère = 0/0 + Père = 0

Pour l'X si l'enfant est une fille :  

- Fille = 0/1, Mère = 0/0 + Père = 0
- Fille = 1/1, Mère = 0/1 + Père = 0
- Fille = 1/1, Mère = 0/0 + Père = 0

!!! note
    Un résultat type "Enfant = 1/1, Mère = 0/0 + Père = 0/0" peut être dû à une erreur de séquençage, mais aussi à une variation de novo associée à une perte d'hétérozygotie.  
    Dénomination à appliquer pour ce genre de cas à définir.

!!! warning "Attention"
    Un génotype parental manquant peut dissimuler une mutation de novo (ex : Enfant = 1/0, mère = 0/0, père = ./.). Ces variations sont généralement gardées, au moins sous un dénomination type "de novo potentiel".

### hétérozygote composite
L'hétérozygotie composite consiste en la présence de deux variations délétères présentes sur un même gène à des positions différentes et chacune héritée d'un seul des parents. Cela fait qu'une maladie autosomique récessive peut se déclarer chez un individu alors qu'aucune variation sur le gène concerné n'a pour GT "1/1".

Si pénétrance complète et sans prendre en compte d'éventuelles mutations de novo :

1. Variation présente uniquement à l'état hétérozygote chez tous les individus touchés
2. Pas de variation à l'état homozygote chez les individus non touchés
3. Une variation hétérozygote chez l'enfant doit être présente chez un seul parent
4. Un gène doit avoir au moins deux variations à l'état hétérozygote chez tous les individus touchés
5. Il doit y avoir au moins une variation transmise par le père et une par la mère

![Règles hétérozygotes composites](/images/het_comp_rules.jpg)

!!! note
    La règle 3 exclut les mutations de novo de ce filtre. Même s'il  est théoriquement possible qu'un enfant soit hétérozygote composite à cause d'une mutation de novo, c'est une hypothèse considérée suffisamment rare pour ne pas être envisagée (particulièrement si plusieurs individus sont malades).
    D'expérience, Christele n'a jamais eu affaire à ce genre de cas.

[Publication dédiée (Kamphans et al.)](https://journals.plos.org/plosone/article/file?id=10.1371/journal.pone.0070151&type=printable)

### variation homozygote récessive
En partant du principe d'une pénétrance complète avec des parents sains :

Pour les autosomes :  

- homozygote chez les individus touchés
- hétérozygote chez les parents
- non homozygote dans la fratrie non touchée

⇒ En résumé : Enfant = 1/1, mère = 0/1, père = 0/1

Pour l'X :  

- hemizygote (garçon), homozygote (fille)
- hétérozygote chez la mère
- absente chez le père
- absente chez les frères/non homozygote chez les sœurs non touchés

⇒ En résumé : Garçon = 1, mère = 0/1, père = 0 ou Fille = 1/1, mère = 0/1, père = 0
