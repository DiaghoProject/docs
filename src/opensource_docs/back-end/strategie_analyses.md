# Strategie Analyses

## Mvp
Pour le mvp on se base sur les informations stockés dans les vcf annotées.
Pour faciliter et homogénéiser l'addition des factories après le release de V1, on se base
sur un modèle commun, les steprecord.

## Source de données de tableau d'interprétation
[![Source de données affiché](/images/20230413_source_donnees_tableaus.png)](/images/20230413_source_donnees_tableaus.png)

## Processus

### MVP (V1)
- Création des personnes, patients, familles etc. liée à un analyse
- Création des samples liés aux patients, personnes etc.
- Chargement de séquençage liées aux samples
    - Création des variants
    - Création des samplerecords
- Création de l'analyse liées aux séquençages, samples etc.
    - Création des analysisrecords
    - Création des steprecords (Step 0, infos de vcf annotée, champs info de Samplerecord)
- Affichage de Tableau d’interprétation

Si l’utilisateur ajoute un filtre complexe:
- Création de Filterstep liée au Analyse
- Création des steprecords (Step 1 - Filter)

Transcript:
- Pour le mvp, les transcrits crée par vep sont ignorées. Le transcrit 
canonique (marqué par "YES", "MANE_SELECT" ou "PICK") est choisi pour l'affichage des
données.

### V2
À chaque instant, l’utilisateur peut ajouter des annotations créées par nos factories.
- Création des steprecords par la factory liée au analysis
- Création des données des transcripts et affichage dans un accordéon

