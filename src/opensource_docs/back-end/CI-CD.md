# CI-CD
- [CI-CD](#ci-cd)
  - [Pre-commit](#pre-commit)
    - [Installation](#installation)
    - [Contourner la vérification](#contourner-la-vérification)
  - [Autoformatter - Black](#autoformatter---black)
  - [Linter - Flake8 + Bugbear](#linter---flake8--bugbear)
    - [Exclusions](#exclusions)
  - [Automatisation des tests](#automatisation-des-tests)
    - [tox](#tox)
    - [Github Actions](#github-actions)


## Pre-commit
[Source](https://pre-commit.com/)
### Installation
Pour installer pre-commit avec tous les packages:

`$ make setup-pre-commit`

Une fois que pre-commit est installé, il va lancer l'autoformatter et le linter avant chaque
commit. S'il y a un souci avec le code, le commit sera annulé.
### Contourner la vérification

Si on veut ajouter un WIP commit sans avoir besoin de verification, on peut ajouter le --no-verify flag:

`$ git commit --no-verify -m "commit-message"`

Note: L'autoformatter et linter font parties des test automatisés sur Github actions. On peut contourner la vérification local mais pas dans le repository.

## Autoformatter - Black
[Source](https://black.readthedocs.io/en/stable/)

Pour lancer seulement l'autoformatter, après avoir installé les packages de *requirements.txt*:

`$ black ./`

Le configuration de black se trouve dans le fichier *pyproject.toml*

## Linter - Flake8 + Bugbear
[Source Flake 8](https://flake8.pycqa.org/en/latest/)
[Source Bugbear](https://pypi.org/project/flake8-bugbear/)

Pour lancer seulement le linter, après avoir installé les packages de *requirements.txt*:

`$ flake8 ./`

Le configuration de flake8 se trouve dans *.flake8*

### Exclusions
On peut trouver les règles de flake8 [ici](https://www.flake8rules.com/)

Les règles exclues pour l'instant sont:

- E203 - Whitespace before ':' - [Raison](https://bit.ly/3ERu3C2)
- E302 - Two blank lines are expected between functions and classes.
- E402 - All module level imports should be at the top of the file. This means that there should be no statements in between module level imports.
- E501 - Line too long
- W292 - No newline at end of file
- W503 - Line break occurred before a binary operator

## Automatisation des tests
### tox
[Source](https://tox.wiki/en/latest/)

Gestion des environments virtuels et organisation des tests. Le configuration se trouve dans le fichier *pyproject.toml* dans la section [tool.tox].

Pour lancer les tests, il faut d'abord:
- installer les packages de requirements.txt
- définir services/backend comme dossier racine

Commande pour lancer les tests tox:

`$ tox`

### Github Actions
[Source](https://docs.github.com/en/actions)

Le Github Actions workflow *testing-for-merge* effectue les actions suivantes:
- Crée un service Postgres pour l'accès à la base de données pendant les tests
- Setup Python
- Installe le package tox pour Github actions [Source](https://www.youtube.com/watch?v=zt51rITH3EA)
- Lance les tests orchestrées par tox
