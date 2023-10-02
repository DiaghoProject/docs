# Liste des familles

!!! note Écran similaire à la [liste des analyses](./list-analyses.md).

Liste les individus enregistrés dans le LBM.

## Actions

- Les lignes du tableau permettent d'accéder à la vue détaillée de la
  [famille](./details-family.md).
- Des onglets permettent d'alterner un affichage par familles, individus ou cas index.
- Un bouton pour créer une nouvelle famille/individu.
- Application de quelques filtres, e.g. les index ayant obtenu un diagnostic ou non, les
  cas urgents, les index dont l'utilisateur a fait/doit faire une analyse biologique…\
  Ces filtres peuvent être applicables sur les familles également (famille dont le cas index
  a obtenu un diagnostic ou non, etc.). Attention : une famille peut contenir plusieurs cas
  index.

## Informations

La liste exhaustive de metadatas à inclure reste à définir. À minima :

### Familles

- Identifiant de la famille
- Nombre de membres
- Date de création
- Nombre d'analyses (analyses où au moins un membre est inclus)
- Projets
- Date de dernière analyse (lancée)

Pas gérable en ce moment:

- Date de dernière interprétation (analyse ouverte)
- Statut (à interpréter, en cours, diag+ total/partiel, diag- total/partiel…)

### Individus/Cas index

- Identifiant dans le SGL si renseigné
- Identité si renseignée
- Sexe
- Age réel/fœtal si renseigné
- Affecté ou non (inutile pour les cas index)
- Identifiant de la famille (permet un lien direct vers la page de détail de la famille)
- Nombre d'apparentés
- Date de création
- Nombre d'analyses
- Projets
- Date de dernière analyse (lancée)
- Date de dernière interprétation (analyse ouverte)
- Statut (à interpréter, en cours, diag+, diag-…)

De manière moins urgente, un système d'accordéon est envisagé pour permettre l'affichage
d'informations secondaires.

Un feedback visuel doit permettre de facilement voir si un individu ou un membre d'une
famille doit bénéficier d'un diagnostic urgent.
