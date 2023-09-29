# Treatment of vcf files

## vt

vt is used to treat vcf files before their data is being processed by django and added to the database.

[Homepage](https://genome.sph.umich.edu/wiki/Vt)

[official repo](https://github.com/atks/vt)

[Diagho fork](https://github.com/3ng7n33r/vt)

### [decompose](https://genome.sph.umich.edu/wiki/Vt#Decompose)

Decompose multiallelic variants in a VCF file. If the VCF file has genotype fields GT,PL, GL or DP, they are modified to reflect the change in alleles. All other genotype fields are removed. The -s option will retain the fields and decompose fields of counts R and A accordingingly.

Decomposition and combining variants is a complex operation where the correctness is dependent on \[tfarrah@github\]:

- whether the observed variants are seen in the same sample,
- if same sample, whether they are homozygous or heterozygous,
- if both heterozygous, whether they are in the same haplotype or not (if known).

and one should be aware of the issues in handling variants resulting from such operations.

Example:

```
#before decomposition
#CHROM  POS     ID   REF     ALT         QUAL   FILTER  INFO                  FORMAT    S1                                     S2                                                                          
1       3759889 .    TA      TAA,TAAA,T  .      PASS    AF=0.342,0.173,0.037	GT:DP:PL	  1/2:81:281,5,9,58,0,115,338,46,116,809	 0/0:86:0,30,323,31,365,483,38,291,325,567	

#after decomposition
#CHROM  POS     ID   REF     ALT         QUAL   FILTER  INFO                                                 FORMAT   S1               S2           
1	  3759889 .    TA      TAA	   .	  PASS    AF=0.342;OLD_MULTIALLELIC=1:3759889:TA/TAA/TAAA/T    GT:PL    1/.:281,5,9      0/0:0,30,323	
1	  3759889 .    TA      TAAA        .      .       AF=0.173;OLD_MULTIALLELIC=1:3759889:TA/TAA/TAAA/T    GT:PL    ./1:281,58,115   0/0:0,31,483	
1	  3759889 .    TA      T           .      .       AF=0.037;OLD_MULTIALLELIC=1:3759889:TA/TAA/TAAA/T    GT:PL    ./.:281,338,809  0/0:0,38,567	
```

#### output

```
    "stats",
    " no. variants                 : 83187",
    "       no. biallelic variants       : 83187",
    "       no. multiallelic variants    : 0",
    "       no. additional biallelics    : 0",
    "       total no. of biallelics      : 83187",
    "Time elapsed: 0.85s",
```

#### checks

- store number of variants for later verifications

### [normalize](https://genome.sph.umich.edu/wiki/Vt#Normalization)

Remove all duplicated information from variants e.g.:

```
Not normalized:
- ref: GCAT
- alt: GTGC

Normalized:
- ref: CAT
- alt: TGC
```

Further details [here](https://genome.sph.umich.edu/wiki/Variant_Normalization)

#### output

```
    "normalize v0.5",
    "options:     input VCF file    DD_WESA_22-6048_vep.decomposed.vcf",
    "         [o] output VCF file   DD_WESA_22-6048_vep.normalized.vcf",
    "         [w] sorting window size                             10000",
    "         [m] no fail on masked reference inconsistency       false",
    "         [n] no fail on reference inconsistency              false",
    "         [q] quiet                                           false",
    "         [d] debug                                           false",
    "         [r] reference FASTA file /code/biodb/chu-rennes.fr/ngs/bio-databases/hg19_UCSC_wo_hap/fasta/hg19.wo_hap.fasta",
    "stats: biallelic",
    "          no. left trimmed                      : 0",
    "          no. right trimmed                     : 0",
    "          no. left and right trimmed            : 0",
    "          no. right trimmed and left aligned    : 0",
    "          no. left aligned                      : 0",
    "       total no. biallelic normalized           : 0",
    "       multiallelic",
    "          no. left trimmed                      : 0",
    "          no. right trimmed                     : 0",
    "          no. left and right trimmed            : 0",
    "          no. right trimmed and left aligned    : 0",
    "          no. left aligned                      : 0",
    "       total no. multiallelic normalized        : 0",
    "       total no. variants normalized            : 0",
    "       total no. variants observed              : 83187",
    "       total no. reference observed             : 0",
    "Time elapsed: 1.44s",
```

#### checks

- normalize: total no. variants observed == decompose: total no. variants

### [sort](https://genome.sph.umich.edu/wiki/Vt#Sorting)

We are using the local approach. From the official documentation:

Performs sorting within a local window. The window size may be set by the -w option. The default window size
is 1000bp and if a record is detected to be potentially out of order due to a small window size, it wil be reported.
Use this when your VCF records are grouped by chromosome but not ordered in short stretches.

#### output

None

#### checks

None

### validate

Checks the following properties of a VCF file:

- order
- reference sequence consistency

#### output

```
    "validate v0.5",
    "options:     input VCF file        DD_WESA_22-6048_vep.sorted.vcf",
    "[r] reference FASTA file           fasta/hg19.wo_hap.fasta"
    "stats:    no. unordered                     : 0",
    "          no. unordered chrom               : 0",
    "          no. inconsistent REF              : 0",
    "          no. variants                      : 83187",
    "Time elapsed: 0.41s"
```

#### checks

- validate: no.variants == decompose: no. variants
- no. inconsistent REF == 0

### uniq - not used

Uniq is not being used. The reason being that vt gives very little feedback about the deleted information. If there are duplicates present, we will identify and log them during the loading process

# TODO

## load

### load samples

### load variants

### write logs

### write columns
