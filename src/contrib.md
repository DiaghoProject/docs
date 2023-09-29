# Contribuer à cette documentation

!!! info
Cette documentation statique est générée automatiquement à l'aide de l'outil [Material for MkDocs](https://squidfunk.github.io/mkdocs-material/), à partir de sources rédigées en [Markdown](#ecrire-en-markdown) dans le dossier `src` du dépôt _GitHub_ suivant : [DiaghoProject/docs-private: Private documentation generator for the Diagho project.](https://github.com/DiaghoProject/docs-private)

!!! tip
Il est possible de modifier directement les sources dans l'interface web de _GitHub_ grâce au bouton d'édition présent sur chaque page de ce site.

```
Un _pipeline GitHub Actions_ est utilisé afin de compiler la documentation à chaque _commit_ dans _main_ afin de la rendre disponible sur [https://private.diagho.com/](https://private.diagho.com/).

Lors de grosses modifications, il est préférable de travailler localement sur une branche contenant les nouveaux _commits_, voire de créer une _pull request_.
```

## Installation locale

Cloner localement le projet :

```bash
$ git clone git@github.com:DiaghoProject/docs-private.git
```

Puis installer l'environment :

```bash
$ cd docs-private
$ make install
```

Enfin, lancer le serveur local pour visualiser les modifications sur [http://127.0.0.1:8000](http://127.0.0.1:8000) :

```bash
$ make serve
```

## Édition locale

Avant toute modification, s'assurer que l'on dispose de la dernière version :

```bash
$ git pull
```

Éditer les fichiers sources (dossier `src`). Le serveur local est rechargé à chaque modification, de sorte que l'on peut voir le rendu directement sur [http://127.0.0.1:8000](http://127.0.0.1:8000).

Lorsque les modifications sont terminées, les _commiter_ :

```bash
$ git add src
$ git commit -m "Description de la modification"
```

Puis  _pusher_ sur _GitHub_ :

```bash
$ git push
```

## Ressources

### Écrire en Markdown

- [Mastering Markdown · GitLab Guides](https://guides.github.com/features/mastering-markdown/)
- [Daring Fireball: Markdown](https://daringfireball.net/projects/markdown/)

### MkDocs

- [Reference - Material for MkDocs](https://squidfunk.github.io/mkdocs-material/reference/)
