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
