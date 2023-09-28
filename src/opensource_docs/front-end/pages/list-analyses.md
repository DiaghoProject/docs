# Liste des analyses

!!! warning "Attention"
    Maquette non définitive

[![Liste d'analyses](/images/mockup/list-analyses.png){ loading=lazy }](/images/mockup/list-analyses.png)

Liste les analyses au sein du LBM que l'utilisateur est en droit de voir.  

### Actions
- Les lignes du tableau permettent de lancer/continuer une [interprétation](./interpretation-table.md).
- Un bouton pour créer une nouvelle analyse
- Application de quelques filtres, e.g. les analyses de l'utilisateur uniquement, les analyses urgentes, les analyses rendues ou non…
- Tri tableur e.g. par date de dernier accès, dernière consultation par l'utilisateur…

### Informations
La liste exhaustive de metadatas à inclure reste à définir. À minima :  

- Identifiant de l'analyse
- Identifiant du cas index
- Projet
- Nombre de samples
- Créateur
- Date de création
- Date de dernier accès
- Statut (à interpréter, en cours, diag+, diag-…)

De manière moins urgente, un système d'accordéon est envisagé pour permettre l'affichage d'informations secondaires.

Un feedback visuel doit permettre de facilement démarquer les analyses urgentes