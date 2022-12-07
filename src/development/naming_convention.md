# Naming Convention

## Django

### Models

### URL

#### Frontend
> The naming convention is based on [Django admin site](https://docs.djangoproject.com/en/4.0/ref/contrib/admin/) naming convention.

For a `Bar` model in a `foo` app, the URLs would be :

| action                                      | URL                    |
| ------------------------------------------- | ---------------------- |
| list                                        | `/foo/bar/`            |
| create                                      | `/foo/bar/add/`        |
| detail                                      | `/foo/bar/1/`          |
| update                                      | `/foo/bar/1/change/`   |
| delete                                      | `/foo/bar/1/delete/`   |
| any methods not dependent on an object      | `/foo/bar/view-name`   |
| any methods dependent on a particular objec | `/foo/bar/1/view-name` |

#### API
> The naming convention is based on [Django REST Framework](https://www.django-rest-framework.org/) naming convention.

For a `Bar` model in a `foo` app, the URLs would be :

| action                                      | URL                            |
| ------------------------------------------- | ------------------------------ |
| list                                        | `/api/v1/foo/bars/`            |
| create                                      | `/api/v1/foo/bars/new/`        |
| detail                                      | `/api/v1/foo/bars/1/`          |
| update                                      | `/api/v1/foo/bars/1/edit/`     |
| delete                                      | `/api/v1/foo/bars/1/delete/`   |
| any methods not dependent on an object      | `/api/v1/foo/bars/view-name`   |
| any methods dependent on a particular objec | `/api/v1/foo/bars/1/view-name` |

### Views
For a `Bar` model in a `foo` app, the view names would be :

| Generic display views | Specific display views |
| --------------------- | ---------------------- |
| DetailView            | BarDetailView          |
| ListView              | BarListView            |

| Generic editing views | Specific editing views |
| --------------------- | ---------------------- |
| CreateView            | BarCreateView          |
| UpdateView            | BarUpdateView          |
| DeleteView            | BarDeleteView          |

### Templates
For a `Bar` model in a `foo` app, the template names would be :

| action | URL                                      |
| ------ | ---------------------------------------- |
| list   | `/templates/foo/bar_list.html`           |
| create | `/templates/foo/bar_form.html`           |
| detail | `/templates/foo/bar_detail.html`         |
| update | `/templates/foo/bar_form.html`           |
| delete | `/templates/foo/bar_confirm_delete.html` |

For `core/templates/core` the generics templates names would be :

| bulma component | function/specificity    | URL                           |
| --------------- | ----------------------- | ----------------------------- |
| card            | a generic card          | `core/cards/generic.html`     |
| card            | a toggleable card       | `core/cards/toggleable.html`  |
| table           | an annotation table     | `core/tables/annotation.html` |

For a `bar` model in a `foo` app, the non-main templates names would be :

| main bulma component | function/specificity    | URL                           |
| -------------------- | ----------------------- | ----------------------------- |
| card                 | a `bar` info card       | `foo/cards/bar_details.html`  |
| card                 | a `bar` list card       | `foo/cards/bar_list.html`     |
| table                | a `bar` list table      | `foo/tables/bar_list.html`    |
| navbar*              | a table upper navbar    | `foo/navbars/table.html`      |

*When it is not refer to specifics objects, consider name the templates with the type of elements wich it refer such as `table.html` in the navbars folder  in order to name a template that include a `navbar` that is link to a `table`.

#### Example :

in core/templates/core
```
└── templates  
    └── core  
        └── cards  
            ├── list_vertical.html  
            ├── list_horizontal.html
            └── object_infos.html  
```
in a `foo` app with `bar` and `baz` models
```
└── templates  
    └── foo 
        |
        ├── block
        |   └── filters.html
        |
        ├── cards
        |   ├── bar_detail.html
        |   └── baz_list.html
        |      
        ├── tables
        |   └── bar_list.html
        |   
        ├── navbars
        |   └── table.html
        |  
        ├── bar_form.html
        ├── bar_detail.html
        ├── bar_list.html
        └── base.html
```
### Generic template inheritance example:

Generic card template in `core/templates/core/cards/object_infos.html`
```html
<div class="card">

    <header class="card-header">
        <h1 class="title is-5">
            {% block card_header %}
            {% endblock card_header %}
        </h1>
    </header>
    <div class="card-content">
        <div class="content">
            {% block card_body %}
            {% endblock card_body %}
        </div>
    </div>
</div>

```

Application specific specific card template for a `bar` model in a `foo` app, in `foo/templates/foo/cards/bar_details`
```html
{% extends "core/cards/object_infos.html" %}

{% block card_header %}
    TITLE
{% endblock card_header %}

{% block card_body %}
    CONTENT
{% endblock card_body %}
```
## Generic template inheritance example with template that inherit from base template

As you can't include multiple `extends` statement in the same template, if  you need to use an `include` statement with an other template like this :

Detail view main template for a `bar` model in a `foo` app, in `foo/templates/foo/bar_detail.html
```html
{% extends "foo/base.html" %}

{% include "foo/cards/bar_detail.html" %}

```
