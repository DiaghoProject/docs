# i18n
Internationalisation et régionalisation

!!! info
    **Règles générales**

    Pour faciliter la collaboration, l'ensemble de l'application est écrite en anglais : le code, les _docstrings_, les variables, les tests, etc.

    On utilise ensuite différents outils (listés ci-dessous) pour fournir des traductions de l'interface et des objets.


## Django : dans le code Python

### `gettext()` vs `ugettext()`

Depuis _Django 2.0_, il s'agit de synonymes.

Voici ce que l'on trouve dans le [code source de Django 2.2](https://github.com/django/django/blob/88d9b28c0c123157a66a288606c16ec5c3486a28/django/utils/translation/__init__.py#L82-L83) :

``` python
# An alias since Django 2.0
ugettext = gettext
```

et [un peu plus bas](https://github.com/django/django/blob/88d9b28c0c123157a66a288606c16ec5c3486a28/django/utils/translation/__init__.py#L102) :

``` python
gettext_lazy = ugettext_lazy = lazy(gettext, str)
```


### Différences entre `gettext()` et `gettext_lazy()`
Dans le [code source de Django 3.2](https://github.com/django/django/blob/8afb677ce787bc886ef378bfc2dd5904194a48ca/django/utils/translation/__init__.py#L135) :

``` python
gettext_lazy = lazy(gettext, str)
```


Réponse intéressante notée dans [python - When should I use ugettext_lazy? - Stack Overflow](https://stackoverflow.com/questions/4160770/when-should-i-use-ugettext-lazy) :

> In definitions like forms or models you should use `ugettext_lazy` because the code of this definitions is only executed once (mostly on django's startup); `ugettext_lazy` translates the strings in a lazy fashion, which means, eg. every time you access the name of an attribute on a model the string will be newly translated-which totally makes sense because you might be looking at this model in different languages since django was started!
>
> In views and similar function calls you can use `ugettext` without problems, because everytime the view is called `ugettext` will be newly executed, so you will always get the right translation fitting the request!


### En résumé
On n'utilise plus `ugettext()` et `ugettext_lazy()`, et on utilise `gettext()` ou `gettext_lazy()` en fonction des cas.

Contrairement à `gettext()`, `gettext_lazy()` permet de traduire du texte en différé, au moment où la chaîne est réellement utilisée plutôt qu’au moment où la fonction est appelée.

Cas d'utilisation de `gettext()` ou `gettext_lazy()` :

| `gettext()` | `gettext_lazy()` |
|---|---|
| views<br>validators<br>admin<br>signal | models<br>form<br>apps<br>settings<br>context_processors |

Pour importer `ugettext()` (ou `ugettext_lazy()`) on utilise l'alias `_` :

``` python
from django.utils.translation import gettext as _
```

``` python
from django.utils.translation import gettext_lazy as _
```

### Ressources

- [Utilitaires Django | Documentation de Django | Django 2.2](https://docs.djangoproject.com/fr/2.2/ref/utils/#module-django.utils.translation)
- [Utilitaires Django | Documentation de Django | Django 3.2](https://docs.djangoproject.com/fr/3.2/ref/utils/#module-django.utils.translation)
- [Django Tips #18 Difference Between ugettext And ugettext_lazy](https://simpleisbetterthancomplex.com/tips/2016/10/17/django-tip-18-translations.html)
- [Traduction | Documentation de Django | Django](https://docs.djangoproject.com/fr/3.2/topics/i18n/translation/)


## Django : créer et modifier les fichiers de langues

Exemple avec une application fictive `bidule` à laquelle on souhaite ajouter les traductions de l'interface en français.

Se placer dans le répertoire de l'application `bidule` et créer le dossier `locale` (s'il n'existe pas encore) :

``` bash
$ cd apps/bidule/
$ mkdir -p locale
```

Pour créer ou mettre à jour un fichier de messages en français, exécutez la commande :

``` bash
$ ../../venv/bin/django-admin makemessages -l fr
```

Editez le fichier `locale/fr/LC_MESSAGES/django.po` créé et compilez le fichier `.po` en un fichier `.mo` :

``` bash
$ ../../venv/bin/django-admin compilemessages
```

## Django : traduction des modèles

Il est quelquefois nécessaire de traduire des champs de modèle. Pour ce faire, on utilise la librairie [django-modeltranslation](https://django-modeltranslation.readthedocs.io).

Par exemple, [voir la traduction des champs `tagline` et `description` de la classe `SiteCustomization` de l'application `core`](https://github.com/DiaghoProject/diagho/blob/main/services/interpretation/apps/core/translation/site.py).

!!! warning
    Attention aux interactions entre les librairies [django-modeltranslation](https://django-modeltranslation.readthedocs.io) et [django-simple-history](https://django-simple-history.readthedocs.io) !

    Ne pas utiliser `history = HistoricalRecords()` dans un modèle lorsque celui-ci comporte des champs marqués par _django-modeltranslation_, mais utiliser plutôt le fichier `translation.py` dans lequel on peut référencer un objet après avoir configuré la traduction.

    Toujour avec l'exemple précédent :

    ``` python
    translator.register(SiteCustomization, SiteCustomizationTranslationOptions)
    simple_history.register(SiteCustomization)
    ```
