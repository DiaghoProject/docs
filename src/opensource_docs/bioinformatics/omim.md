# OMIM

[OMIM](https://www.omim.org/) (Online Mendelian Inheritance in Man) est une base de données associant des maladies à des gènes.

C'est une source d'annotation essentielle pour les biologistes. Sa consultation en ligne est libre mais le téléchargement de leurs données ou l'accès à leur API nécessite un accord de la John Hopkins University qui n'en autorise pas un usage dans un logiciel commercial.

## Fonctionnement

Chaque entité dans la base de données est associée à un MIM number que ce soit un phénotype ou un gène. Ils sont accessibles indistinctement via l'URL `https://www.omim.org/entry/{MIMnumber}`.

Ces MIM numbers sont associés à un caractère spécial selon l'entité concernée :

- **[*](https://www.omim.org/entry/608958)** pour les MIM numbers de gènes
- **[#](https://www.omim.org/entry/100100)** pour les MIM numbers de phénotypes dont la base moléculaire est connue
- **[%](https://www.omim.org/entry/193090)** pour les MIM numbers de phénotypes dont la base moléculaire n'est pas encore connue
- **[+](https://www.omim.org/entry/104250)** pour les MIM numbers concernant un gène et un phénotype combiné (rare)

## Fichiers disponibles

- **mim2gene.txt** est un fichier librement accessible associant les MIM numbers à leur ID NCBI, Ensembl et nom de gène approuvé
- **genemap2.txt** associe des positions génomiques à un gène, ses ID et phénotypes associés (nom, mode de transmission et MIM number #)
- **morbidmap.txt** associe chaque maladie à un gène et le MIM number * du gène

??? abstract "Exemples"
    === "mim2gene"
        ```text
            # MIM Number	MIM Entry Type (see FAQ 1.3 at https://omim.org/help/faq)	Entrez Gene ID (NCBI)	Approved Gene Symbol (HGNC)	Ensembl Gene ID (Ensembl)
            100050	predominantly phenotypes			
            100070	phenotype	100329167		
            100100	phenotype			
            100200	predominantly phenotypes			
            100300	phenotype			
            100500	moved/removed			
            100600	phenotype			
            100640	gene	216	ALDH1A1	ENSG00000165092
            100650	gene/phenotype	217	ALDH2	ENSG00000111275
            100660	gene	218	ALDH3A1	ENSG00000108602
            100670	gene	219	ALDH1B1	ENSG00000137124
            100675	predominantly phenotypes			
            100678	gene	39	ACAT2	ENSG00000120437
            100680	moved/removed	
        ```

    === "genemap2"
        ```text
            # Chromosome	Genomic Position Start	Genomic Position End	Cyto Location	Computed Cyto Location	MIM Number	Gene Symbols	Gene Name	Approved Gene Symbol	Entrez Gene ID	Ensembl Gene ID	Comments	Phenotypes	Mouse Gene Symbol/ID
            chr1	0	123400000	1p		606788	ANON1	Anorexia nervosa, susceptibility to, 1		171514			{Anorexia nervosa, susceptibility to, 1}, 606788 (2)	
            chr1	0	2300000	1p36.33		618815	C1DUPp36.33, DUP1p36.33	Chromosome 1p36.33 duplication syndrome, ATAD3 gene cluster					Chromosome 1p36.33 duplication syndrome, ATAD3 gene cluster, 618815 (4), Autosomal dominant	
            chr1	0	20100000	1pter-p36.13		115665	CTRCT8, CCV	Cataract, congenital, Volkmann type		7792		linked to Rh in Scottish family	Cataract 8, multiple types, 115665 (2), Autosomal dominant	
            chr1	0	27600000	1pter-p36		131190	ERPL1, HLM2	Endogenous retroviral pol gene-like sequence 1 (oncogene HLM2)						
            chr1	0	123400000	1p		605606	PSORS7	Psoriasis susceptibility 7		65245			{Psoriasis susceptibility 7}, 605606 (2)	
            chr1	0	94300000	1pter-p22.1		154280	SAI1, MTS1, TFS1	Suppression of anchorage independence-1 (malignant transformation suppression-1)		6298				
            chr1	923922	944573	1p36.33	1p36.33	616765	SAMD11, MRS	Sterile alpha motif domain-containing protein 11	SAMD11	148398	ENSG00000187634			Samd11 (MGI:2446220)
            chr1	944202	959255	1p36.33	1p36.33	610770	NOC2L, NIR	NOC2-like nucleolar-associated transcriptional repressor	NOC2L	26155	ENSG00000188976			Noc2l (MGI:1931051)
            chr1	960583	965718	1p36.33	1p36.33	619262	KLHL17, AF	Kelch-like 17	KLHL17	339451	ENSG00000187961			Klhl17 (MGI:2678948)
            chr1	975197	982092	1p36.33	1p36.33	615921	PERM1, C1orf170	PPARGC1-and ESRR-induced regulator, muscle, 1	PERM1	84808	ENSG00000187642			Perm1 (MGI:1921433)
            chr1	998963	1000096	1p36.31	1p36.33	608060	HES4	Hes family bHLH transcription factor 4	HES4	57801	ENSG00000188290			

        ```

    === "morbidmap"
        ```text
            # Phenotype	Gene Symbols	MIM Number	Cyto Location
            17,20-lyase deficiency, isolated, 202110 (3)	CYP17A1, CYP17, P450C17	609300	10q24.32
            17-alpha-hydroxylase/17,20-lyase deficiency, 202110 (3)	CYP17A1, CYP17, P450C17	609300	10q24.32
            2,4-dienoyl-CoA reductase deficiency, 616034 (3)	NADK2, C5orf33, DECRD	615787	5p13.2
            2-methylbutyrylglycinuria, 610006 (3)	ACADSB, SBCAD	600301	10q26.13
            3-M syndrome 1, 273750 (3)	CUL7, 3M1	609577	6p21.1
            3-M syndrome 2, 612921 (3)	OBSL1, KIAA0657, 3M2	610991	2q35
            3-M syndrome 3, 614205 (3)	CCDC8, 3M3	614145	19q13.32
            3-Methylcrotonyl-CoA carboxylase 1 deficiency, 210200 (3)	MCCC1, MCCA	609010	3q27.1
            3-Methylcrotonyl-CoA carboxylase 2 deficiency, 210210 (3)	MCCC2, MCCB	609014	5q13.2
            3-hydroxyacyl-CoA dehydrogenase deficiency, 231530 (3)	HADHSC, SCHAD, HHF4	601609	4q25
            3-hydroxyisobutryl-CoA hydrolase deficiency, 250620 (3)	HIBCH	610690	2q32.2
            3-methylglutaconic aciduria with deafness, encephalopathy, and Leigh-like syndrome, 614739 (3)	SERAC1, MEGDEL	614725	6q25.3
            3-methylglutaconic aciduria, type I, 250950 (3)	AUH	600529	9q22.31
            3-methylglutaconic aciduria, type III, 258501 (3)	OPA3, MGA3	606580	19q13.32
            3-methylglutaconic aciduria, type IX, 617698 (3)	TIMM50, TIM50, MGCA9	607381	19q13.2
        ```

### Caractères spéciaux des phénotypes

- Les [crochets](https://www.omim.org/entry/615999) `[]` encadrent des phénotypes non délétères.
- Les [accolades](https://www.omim.org/entry/603933) `{}` encadrent des facteurs de risques pour des maladies multifactorielles.
- Un phénotype précédé d'un [point d'interrogation](https://www.omim.org/entry/607131) `?` indique que le lien gène-phénotype est provisoire.

Les phénotypes sont également suivi par un chiffre entre parenthèses :

- **1** indique que l'atteinte est mappée par son association avec un gène sans que la cause moléculaire ait pu être déterminée
- **2** indique que l'atteinte a été mappée par des méthodes statistiques sans qu'une variation ait été trouvée
- **3** indique que la cause moléculaire est connue
- **4** indique que l'atteinte est causée par une duplication ou délétion de gènes
