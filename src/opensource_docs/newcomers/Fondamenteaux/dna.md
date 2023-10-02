# L’ADN

Notre ADN est présent dans presque toutes les cellules de notre corps sous la forme des
biens connue des **chromosomes**. Pour celui-ci, c'est comme un mode d'emploi de trois
milliards de caractères (les **bases** A, T, C et G) expliquant comment fabriquer les
**protéines** qui le composent et assurant son bon développement et fonctionnement. La
tâche des généticiens consiste grosso modo à y trouver la faute de frappe.\
La séquence entière de la chaîne d'ADN est appelé le **génome**.

Cette macro-molécule est composée de deux **brins** complémentaires formant la fameuse
double hélice.

!!! example "Des brins complémentaires" Ils sont le miroir l'un de l'autre en ce sens
que chaque base s'apparie avec une base précise (A avec T, C avec G) et parce que chacun
se "lit" dans le sens opposé\
Ainsi si un brin possède la séquence **5'-ATTCG-3'**\
son homologue aura normalement **3'-TAAGC-5'**

```text
Il n'y a donc besoin de connaître la séquence que d'un seul brin pour connaître celle de son opposé, aussi la norme est de lire dans le sens appelé 5'-3'.
```

## Les chromosomes

Les humains possèdent 23 paires de chromosomes, une de ces paires servant à définir le
sexe de l'individu (XX pour les femmes, XY pour les hommes). Chaque paire est composée
d'un chromosome de la mère et un du père. Ce point aura son importance pour la suite.\
Chaque chromosome n'est en réalité qu'une seule longue chaîne d'ADN ininterrompue. Sa forme
bien connue en X n'est dû qu'au fait que la molécule d'ADN doit s'entortiller de manière
la plus compacte possible lorsqu'une cellule se divise, mais elle se "redéroule" pour fonctionner
une fois cette étape passée.

## Les gènes

L'ADN entier ne sert pas directement à fabriquer les protéines. Les sections qui ont
cette fonction sont appelées les **gènes** et forment la **région codante** de l'ADN
(car codant la fabrication de protéines).\
Ces gènes sont eux-mêmes subdivisés en deux types de segments principaux, les **exons** qui
codent effectivement les protéines comme on le verra plus loin, séparés par des **introns**
qui sont de longues portions non codantes au sein des gènes.

[![Gène](./images/gene.jpg)](./images/gene.jpg)

La séquence formée par l'ensemble de ces 180 000 exons est appelée **exome**. Comme
l'exome représente environ 1,5% du génome total, les laboratoires se contentaient
souvent de séquencer cette portion suffisante pour effectuer ~85% des diagnostics.
Cependant avec les progrès techniques et informatiques, l'écart avec le génome ne fait
que se réduire, rendant cette option viable en routine pour un certain nombre de
laboratoire.

## L'ARN

L’ADN n’est pas le support direct de la synthèse des protéines, il doit passer par un
proxy sous la forme d’**ARN messager** (ARNm) appelé un **transcrit**.\
L'étape de transcription consiste en la fabrication d'un brin d'ARN pré-messager en complémentarité
d'un brin matrice d'ADN. Ainsi une séquence d'ADN `5'-ATTCG-3'` formera un brin d'ARN `UAAGC`
(des U sont utilisés à la place des T pour l'ARN).\
Cet ARN pré-messager subira une maturation consistant en l'excision des introns qui,
comme évoqué plus haut, sont non codants. Cette étape importante s'appelle
l'**épissage** et si elle est perturbée, elle peut être la cause de certaines maladies
rares.\
Enfin, cet ARNm pourra servir de support pour la fabrication de protéines.

[![Transcription/Traduction](./images/gene_maturation.png)](./images/gene_maturation.png)

Il est à noter qu'un même gène peut être source de plusieurs transcrits aux fonctions
différentes. En effet, tous les exons du gène ne sont pas nécessairement gardés sur le
brin d'ARN lors de sa maturation. La protéine produite sera donc différente. On parle
alors d'**épissage alternatif**. C'est pourquoi les généticiens rendent leurs
conclusions sur des transcrits plutôt que des gènes.

## Le code génétique

Le code génétique est largement partagé à travers tout le monde du vivant sur la Terre
et régule la façon dont l'ADN finit par être traduit en protéine.\
Si en informatique un octet composé de 8 bits code une information, en génétique, un **codon**
de trois bases code pour un **acide aminé** de la protéine finale (celle-ci n'étant qu'un
enchainement d'acides aminés). Ceci a son importance car si dans un gène, la séquence est
raccourcie ou allongée d'un non multiple de 3, cela va provoquer un **frameshift** (ou décalage
du cadre de lecture) modifiant toute la suite de la protéine et ayant donc une conséquence
généralement plus importante\[^1\]

!!! note
    "En résumé" \- L'ADN est la single source of truth dans la production de
    protéines par le corps. \- Il est divisé en 23 paires de chromosomes, chaque paire étant
    composée d'un chromosome maternel et un paternel. \- Les exons des gènes forment la
    partie codante de l'ADN. \- Les transcrits sont le support direct à partir duquel sont
    synthétisées les protéines. \- Le code génétique est la correspondance entre des
    triplets de bases azotées avec un acide aminé.

!!! tip "Métaphore mnémotechnique" \- L'ADN est la base de données de l'organisation. \-
Les gènes sont les procédures généralistes pour la production de l'organisation. \- Les
transcrits sont des variantes des procédures de fabrication pour adapter le produit² aux
besoins du client. \- Chaque codon est une étape de la conception du produit fini.

\[^1\]: cf les [types de variations](./variants.md)
