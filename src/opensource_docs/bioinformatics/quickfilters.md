# Filtres rapides

Les filtres rapides sont des filtres pré-établis pour permettre une application simple et rapide de filtres courants dans le cadre d'une interprétation et accessibles via un menu dédié.

Ils sont simples pour l'utilisateur mais en coulisses fonctionnent comme n'importe quel autre filtre.
Par exemple, si un utilisateur ne veut afficher que les variations non-sens ou frameshift et prédites délétères par SIFT, il lui suffirait de cliquer sur 3 checkbox pour que soit demandé en pseudocode `(Consequence = "stop_gained" OR Consequence = "frameshift_variant") AND sift_prediction = "deleterious"`
Ceci pourrait totalement être faisable via un filtre avancé, mais l'idée est qu'ici il est appliqué en 3 clics au lieu de plus d'une vingtaine.

Ce filtre rapide serait ensuite appliqué en ET aux filtres pré-existants.

!!! success "Feuille de route"
\- \[x\] Dictionnaire de filtres prédéfinis à servir au front · [Détails](#liste-de-filtres-a-implementer) · [206-B-09](https://github.com/orgs/DiaghoProject/projects/5/views/1?pane=issue&itemId=25846767)
\- \[x\] Affichage et application possible des filtres rapides transmis par le back · [206-F-10](https://github.com/orgs/DiaghoProject/projects/5/views/1?pane=issue&itemId=20780023)
\- \[x\] Ne servir que les filtres applicables à l'analyse chargée · [Détails](#detection-des-annotations) · [206-B-12](https://github.com/orgs/DiaghoProject/projects/5/views/1?pane=issue&itemId=30106689)
\- \[x\] Permettre à l'utilisateur de modifier la valeur proposée par défaut · [Détails](#personnalisation-des-filtres-proposes)
\- \[ \] Gestion filtres inclusifs/exclusifs · [Détails](#comportements-de-filtres)
\- \[ \] [La suite](#la-suite)

[![Exemple de menu de filtres rapides](/images/quickfiltermenu.png){ align=right }](/images/quickfiltermenu.png)

## Détection des annotations

Avant de proposer l'application d'un filtre rapide, il est généralement nécessaire de vérifier la présence d'une annotation. En absence des colonnes nécessaires, il serait inutile de servir le filtre au front.
À l'inverse, si plusieurs des colonnes possibles ont été ajoutées au VCF, n'utiliser que la première rencontrée (une priorisation des sources d'annotation a parfois été faite).

## Personnalisation des filtres proposés

Certains filtres gagneraient à offrir en sus un input pour permettre au biologiste de facilement influer sur la stringence du filtre bien qu'une valeur par défaut soit préremplie (ex : DP ou fréquences).

## Comportements de filtres

Par défaut, tout nouveau filtre rapide sélectionné se cumule en AND à tout autre filtre déjà appliqué.

Néanmoins, un même filtre peut servir à appliquer différentes valeurs. Ils sont alors réunis dans une sous-catégorie avec deux comportements sont possibles :

- Les filtres inclusifs
- Les filtres exclusifs

### Filtres inclusifs

Ils sont inclusifs car plus de critères sont sélectionnés au sein d'une catégorie, plus ils remonteront de variations. Sauf spécification contraire c'est le comportement par défaut d'une sous-catégorie.

!!! quote ""
Ex : afficher les variations situées dans un exon OU au niveau d'un site d'épissage

Concrètement, côté front, cela reposerait sur un fonctionnement en "simple checkbox". Chaque filtre est appliqué en OR **au sein** d'une sous-catégorie (et la sous-catégorie appliquée en AND aux autres filtres).

!!! quote ""
Exemple :
Dans IMPACT, choisir à la fois HIGH et MODERATE équivaut à :\
`     <autres_filtres> AND (IMPACT = "HIGH" OR IMPACT = "MODERATE")     `

### Filtres exclusifs

Ils sont exclusifs car contradictoires entre eux.

!!! quote ""
Ex : aucune variation peut être de novo ET héritée

Côté front, le fonctionnement serait celui de "radio buttons".

!!! warning "Attention"
Cette exclusivité peut s'appliquer entre différentes catégories.\
Par exemple, il n'y aurait pas de sens de chercher une variation avec un `Effect > Type > Splicing` dans une `Location > Region > UTR`\
Au vu de la complexité pour gérer tous les use cases, il restera de la responsabilité de l'utilisateur de concevoir des filtres cohérents.

### Exemple

[![Exemple de filtrage rapide](/images/quickfilterexample.png){ align=left }](quickfilterexample.png)

Le filtrage correspondant à ce formulaire serait :

```
dp>20 
AND FILTER="PASS" 
AND CHROM LIKE 'X' 
AND (Func.refGeneWithVer LIKE "exonic" OR Func.refGeneWithVer LIKE "splicing")
```

Explication :

- DP et FILTER ne sont pas dans une sous-catégorie : ils se coordonnent en AND.
- Seul les variations du chromosome X sont souhaitées.
- Exon et Site d'épissage sont deux critères possibles et non contradictoires du filtrage par Région : on veut donc les variations répondent à un critère OU l'autre.

**En résumé :** l'utilisateur veut ici les variations passant les filtres du pipeline bioinfo, avec une profondeur d'au moins 20X, situées dans les exons ou les sites d'épissage des gènes du chromosome X.

## Liste de filtres à implémenter

Liste en pseudocode des filtres à implémenter.

### Inheritance

#### Genotype

Critères exclusifs

!!! warning "Attention"
Ces filtres sont naïfs et seront amenés à être affinés.

- Allelic balance

```
	kid.allelic_balance : 0.00 to 1.00
	mom.allelic_balance : 0.00 to 1.00
	dad.allelic_balance : 0.00 to 1.00
```

- All
- Heterozygous

```
	sample.gt_type = 1
```

- Homozygous

```
if trio
	kid.gt_type = 2
	&&
	(
		(mom.gt_type = 1 && dad.gt_type = 1)
	||
		(mom.gt_type = 1 && dad.gt_type = 3)
	||
		(mom.gt_type = 3 && dad.gt_type = 1)
	||
		(mom.gt_type = 3 && dad.gt_type = 3)
	)
else
	sample.gt_type = 2
```

Critères exclusifs

!!! warning "Attention"
Possible seulement si index avec au moins un parent.
Ces filtres sont naïfs et seront amenés à être affinés.

- All
- De novo (strict)

```
if trio
	kid.gt_type = 1
	& mom.gt_type = 0
	& dad.gt_type = 0
```

- De novo (accept missing)

```
if trio
	kid.gt_type = 1
	&& 
	(
		(mom.gt_type = 3 && dad.gt_type = 0)
	||
		(dad.gt_type = 3 && mom.gt_type = 0)
	)
```

- Inherited (gt_type)

```
if trio
	(kid.gt = 1 || kid.gt = 2)
	& (
		(mom.gt = 1 || mom.gt = 2)
		|| (dad.gt = 1 || dad.gt = 2)
	)
```

- present in the mother

```
mom.gt_type = 1 or mom.gt_type = 2
```

- present in the father

```
dad.gt_type = 1 or dad.gt_type = 2
```

- absent from the mother

```
mom.gt_type = 0
```

- absent from the father

```
dad.gt_type = 0
```

### Quality

- Depth

```
DP > (par défaut: 20)
```

- FILTER

```
FILTER = PASS
```

### Location

#### Chromosome

- Autosomal

```
CHROM iregex ^(chr)?([1-9]|1[0-9]|2[0-2])$
```

- X-linked

```
CHROM contains /X$/ 
```

- Mitochondrial

```
CHROM contains /M$/
```

#### Region

- Exonic

```
if has column /^Func.refGene/  // annotation par Annovar
	column contains exonic
else if has column consequence || Annotation   // annotation VEP ou SnpEff
	column contains synonymous_variant || missense_variant || inframe_insertion || inframe_deletion || stop_gained || frameshift_variant || coding_sequence_variant || start_retained_variant || start_lost || incomplete_terminal_codon_variant
```

- Intronic

```
if has column /^Func.refGene/  // annotation par Annovar
	column contains intronic
else if has column consequence || Annotation   // annotation VEP ou SnpEff
	column contains intron_variant
```

- UTR

```
if has column /^Func.refGene/  // annotation par Annovar
	column contains UTR5 || UTR3
else if has column consequence || Annotation   // annotation VEP ou SnpEff
	column contains 5_prime_UTR_variant || 3_prime_UTR_variant
```

- Intergenic

```
if has column /^Func.refGene/  // annotation par Annovar
	column contains intergenic || upstream || downstream
else if has column consequence || Annotation   // annotation VEP ou SnpEff
	column contains intergenic_variant || upstream_gene_variant || downstream_gene_variant	
```

### Consequence

#### Type

- Missense

```
if has column /^ExonicFunc/  // annotation par Annovar
	column = nonsynonymous_SNV
else if has column consequence || Annotation   // annotation VEP ou SnpEff
	column contains missense_variant
```

- Nonsense

```
if has column /^ExonicFunc/  // annotation par Annovar
	column = stopgain
else if has column consequence || Annotation   // annotation VEP ou SnpEff
	column contains stop_gained
```

- Splicing

```
if has column /^Func.refGene/  // annotation par Annovar
	column contains splicing
else if has column consequence || Annotation   // annotation VEP ou SnpEff
	column contains splicing_donor_variant || splicing_acceptor_variant || splice_region_variant || splice_donor_5th_vase_variant || splice_donor_region_variant || splice_polypyrimidine_tract_variant
```

- Indel

```
if has column /^ExonicFunc/  // annotation par Annovar
	column nonframeshift_insertion || nonframeshift_deletion || frameshift_insertion || frameshift_deletion
else if has column consequence || Annotation   // annotation VEP ou SnpEff
	 column contains frameshift_variant || inframe_insertion || inframe_deletion
```

- Synonymous

```
if has column /^ExonicFunc/  // annotation par Annovar
	column synonymous_SNV
else if has column consequence || Annotation   // annotation VEP ou SnpEff
	column contains synonymous_variant
```

#### Impact

- HIGH

```
if has column IMPACT || Annotation_Impact    // annotation VEP ou SnpEff
	column = HIGH
```

- MODERATE

```
if has column IMPACT || Annotation_Impact    // annotation VEP ou SnpEff
	column = MODERATE
```

- LOW

```
if has column IMPACT || Annotation_Impact    // annotation VEP ou SnpEff
	column = LOW
```

- MODIFIER

```
if has column IMPACT || Annotation_Impact    // annotation VEP ou SnpEff
	column = MODIFIER
```

### Population frequencies

- gnomAD

```
if has column gnomAD_genomes_POPMAX_AF || gnomAD_genomes_AF || gnomAD_exomes_POPMAX_AF || gnomAD_exomes_AF || gnomAD_AF
	column < (par défaut : 0.01)
```

- gnomAD homozygote alt

```
if has column gnomAD_genomes_nhomalt || gnomAD_exomes_nhomalt || gnomAD_nhomalt
	column =< (par défaut : 2)
```

- Kaviar

```
if has column Kaviar_AF
	Kaviar_AF < (par défaut : 0.01)
```

- Kaviar Allele Count

```
if has column Kaviar_AC
	Kaviar_AC < (par défaut : 2)
```

### In silico prediction

- SIFT

```
if has column sift_pred    // ANNOVAR
	sift_pred = D
else if has column "SIFT"    // VEP
	SIFT contains deleterious
```

- PolyPhen

```
if has column Polyphen2_HVAR_pred   // ANNOVAR + HVAR
	Polyphen2_HVAR_pred = D
else if has column Polyphen2_HDIV_pred   // ANNOVAR + HDIV
	Polyphen2_HDIV_pred = D
else if has column PolyPhen    // VEP
	PolyPhen contains probably_damaging
```

- CADD Phred

```
if has column /CADD_Phred/
	column >= (par défaut : 15)
```

- REVEL

```
if has column REVEL_score
	REVEL_score > (par défaut : 0.5)
```

- GERP++

```
if has column GERP++_RS || GERP___RS
	column > (par défaut : 5.5)
```

## La suite

- Mode de transmission
  - Gestion des [hétérozygotes composites](http://127.0.0.1:8001/ressources/bioinformatics/filter_strategies/#heterozygote-composite) (plusieurs variations hétérozygotes (0/1) dans un même gène et héritées de différents parents)
  - Gestion affinée grâce à l'utilisation des `is_affected` et liens familiaux entre samples
  - Gestion encore plus fine en prenant en compte un potentiel facteur de pénétrance incomplète
- La VAF pour la gestion des mosaïques
- Une catégorie "Panels" permettra de choisir d'appliquer un filtrage via un des panels de gènes dans la DB.
