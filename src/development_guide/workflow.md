# Workflow (fr)

!!! warning
    This page will be translated into English during the next updates.

## Qu'est-ce que le flux de travail ou _workflow_ ?
Le _codebase_ du projet __Diagho__ est hébergé sur la plateforme [GitHub](https://github.com/DiaghoProject). Pour conserver un _codebase_ cohérent et faciliter la collaboration entre contributeurs, nous nous appuyons sur le [GitHub flow](https://guides.github.com/introduction/flow/) pour définir les règles de développement.

Le [GitHub flow](https://guides.github.com/introduction/flow/) est l'un des _workflows_, ou flux de travail, couramment utilisé pour les projets _open source_ et peut se résumer en quelques points principaux :

- la branche `main` est toujours stable et déployable ;
- les tags sur la branch `main` sont considérées comme les _releases_ ;
- les contributeurs doivent _forker_ ou créer une nouvelle branche (s'ils ont les droits suffisants sur le _repo_ original) pour ajouter de nouvelles fonctionnalités ou corriger des _bugs_ et soumettre une _pull request_ afin de fusionner leur branche dans `main`.

## En pratique

### Cloner ou forker le code localement
``` bash
$ git clone git@github.com:DiaghoProject/diagho.git
```

### Créer une nouvelle branche et basculer dessus
``` bash
$ git checkout -b name-of-your-bugfix-or-feature
```

### Définir la branche _upstream_
``` bash
$ git push --set-upstream origin name-of-your-bugfix-or-feature
```

### Ajout des _commits_ et _push_ de la branche sur GitHub
``` bash
$ git add .
$ git commit -m "Detailed description of your changes."
$ git push
```

### Ouverture d'une _Pull Request_

### Échanges et revue du code

### Déploiement

### Fusion dans la branche principale (_merge_)

## Ressources
- [Understanding the GitHub flow](https://guides.github.com/introduction/flow/)
