# Versioning (fr)

!!! warning
This page will be translated into English during the next updates.

## Gestion sémantique de version

Pour numéroter les versions des différents modules de __Diagho__, nous nous appuyons sur la spécification [SemVer](https://semver.org/), ou _Semantic Versioning Specification_.

En bref, étant donné un numéro de version `MAJEUR.MINEUR.CORRECTIF`, il faut incrémenter :

- le numéro de version `MAJEUR` quand il y a des changements non rétrocompatibles ;
- le numéro de version `MINEUR` quand il y a des ajouts de fonctionnalités rétrocompatibles ;
- le numéro de version de `CORRECTIF` quand il y a des corrections d’anomalies rétrocompatibles.

!!! note
    L’identifiant de version majeure zéro `0.1.0` est destiné au développement initial. Tout ou partie peut être modifié à tout moment.

!!! note
    Lorsque l’API publique est considérée stable, l'identifiant de version majeure est incrémenté à `1.0.0`.

## Le fichier `CHANGELOG.md`

Pour chaque _repo_ du projet, un journal des modifications doit être tenu, généralement dans le fichier `CHANGELOG.md`.

Exemple de contenu :

```markdown
# Changelog

## 0.1.0 (unreleased)

### Initial version
- Creation of this very application from scratch.
```
