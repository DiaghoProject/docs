# Principaux modèles utilisés

## Rappel du fichier d'entrée
Les données patients chargées sur l'application se présenteront notamment sous la forme de [fichiers VCF](/ressources/bioinformatics/vcf) (Variant Call Format). Ce fichier correspond en résumé à la liste des différences observées entre l'ADN de patients et un **génome de référence**.

Outre le header, chaque ligne correspond à une **variation** : une position sur un chromosome, la/les base(s) sur le génome de référence, la/les base(s) observée(s) chez au moins un échantillon (un sujet). 

![VCF](/ressources/newcomers/images/vcf.jpg)

Le **génotype** (abrégé GT) du patient correspond à la présence ou non de la variation chez ce dernier.
Pour prendre en exemple la première ligne du VCF ci-dessus, en position 14370 du chromosome 20 :  

- la personne NA00001 porte une G sur ses deux chromosomes (0|0)  
- la personne NA00002 porte une G sur un chromosome et une A sur l'autre (1|0)  
- la personne NA00001 porte une A sur ses deux chromosomes (1/1)  

## Les modèles
#### Assembly
Il correspond à un génome de référence (GRCh38/hg38 qui tend à supplanter GRCh37/hg19).

#### Assession
Les accessions sont des "sous-versions" d'un génome de référence d'organismes comme NCBI (USA) ou Ensembl (UE). Ils sont extrêmement similaires entre eux mais peuvent différer sur certains scaffolds alternatifs.

#### Region
Correspond aux chromosomes.

#### Variant
Position, Reference et Alternative sur une Region.

#### Feature
Séquence d'ADN définie par un chromosome, un début et une fin qui peut correspondre à un gène, un exon, un transcrit…

#### Person
Un individu dans la base de données. Plusieurs samples peuvent être au nom d'un individu.

#### Family
Une famille est un regroupement de *Persons* apparentés.

#### Patient
Un proxy vers une *Person* notée comme cas index (personne pour qui est prévu le diagnostic initial).

#### Sequencing
Un VCF parsé dont est extrait les *variants* et *samples*.

#### Sample
Lien entre le sample d'un *sequencing* et une *person* (chaque colonne bleue du VCF ci-dessus = un sample).

#### SampleRecord
Une ligne d'un *sample* ainsi que le contenu de la colonne INFO.

#### Analyses
Le lancement de l'analyse d'un ou plusieurs *samples* afin de les annoter et pré-filtrer et d'en permettre l'interprétation ultérieure par un utilisateur.

#### AnalysisRecord
Une jointure entre un *variant* et les différents *SampleRecords* des *samples* retenus pour l'*analysis*

#### Factories
Modules d'annotations pour enrichir les informations d'un *AnalysisRecord*

[![Schéma parcours de données](/images/simplified_pres.jpg)](/images/simplified_pres.jpg)
