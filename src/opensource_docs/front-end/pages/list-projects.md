# Liste des projets

!!! note
  Écran similaire à la [liste des analyses](./list-analyses.md).

Liste les projets du LBM auxquels l'utilisateur a accès.

## Actions

- Les lignes du tableau permettent d'accéder à la vue détaillée du
  [projet](./details-project.md) si l'utilisateur en a le droit.
- Créer un nouveau projet
- Application de quelques filtres, e.g. masquer les projets dont l'utilisateur n'a pas
  les droits d'accès, n'afficher que les projets de génétique
  constituionnelle/somatique/recheche, afficher les projets avec dossiers urgents en
  attente d'interprétation…

## Informations

Tous les projets devraient être visibles mais seuls les utilisateurs autorisés devraient
pouvoir en connaître les analyses.

La liste exhaustive de metadatas à inclure reste à définir. À minima :

- Nom du projet
- Type de projet (constit', somatique, recherche, autre)
- Nombre d'analyses
- Nombre de collaborateurs sur le projet
- Date de création
- Date de dernière analyse créée
- Date de dernière analyse lancée

De manière moins urgente, un système d'accordéon est envisagé pour permettre l'affichage
d'informations secondaires.
