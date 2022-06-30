# Naming Convention

## Django

### Models

### URL

#### Frontend
> The naming convention is based on [Django admin site](https://docs.djangoproject.com/en/4.0/ref/contrib/admin/) naming convention.


For a `Bar` model in a `foo` app, the URLs would be :

| action | URL |
|---|---|
| list | `/foo/bar/` |
| create | `/api/v1/foo/bar/add/` |
| detail | `/api/v1/foo/bar/1/` |
| update | `/api/v1/foo/bar/1/change/` |
| delete | `/api/v1/foo/bar/1/delete/` |
| any methods not dependent on an object | `/api/v1/foo/bar/view-name` |
| any methods dependent on a particular objec | `/api/v1/foo/bar/1/view-name` |


#### API
> The naming convention is based on [Django REST Framework](https://www.django-rest-framework.org/) naming convention.

For a `Bar` model in a `foo` app, the URLs would be :

| action | URL |
|---|---|
| list | `/api/v1/foo/bars/` |
| create | `/api/v1/foo/bars/new/` |
| detail | `/api/v1/foo/bars/1/` |
| update | `/api/v1/foo/bars/1/edit/` |
| delete | `/api/v1/foo/bars/1/delete/` |
| any methods not dependent on an object | `/api/v1/foo/bars/view-name` |
| any methods dependent on a particular objec | `/api/v1/foo/bars/1/view-name` |

### Views

### Templates
