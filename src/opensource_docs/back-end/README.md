# diagho-core
The core application of the Diagho project.

## Installation

### Requirements
- [Docker](https://docs.docker.com/get-docker/): we use _Docker_ to develop and run __Diagho__. This is a strict requirement to use this project.
- [Docker Compose](https://docs.docker.com/compose/install/): we use _Docker Compose_ to simplify the orchestration of all __Diagho__ application services, using configuration files for different environments (such as _dev_, _test_, _staging_ or _prod_).

Download this repository and unzip it on your computer. You should rename the folder `diagho-core-main` in `diagho-core`.

Or clone the repository directly on your computer:
``` bash
$ git clone git@github.com:DiaghoProject/diagho-core.git
```

> __Warning!__  
> You may have to change permissions on some scripts :
> ```bash
> $ chmod +x utils/*.sh
> ```

### Install and run a development environment
__Diagho__ stores config in environment variables.
When using _Docker Compose_ to run __Diagho__, the `.env` file is used to define all required environment variables.
You should never edit this `.env` file directly or store sensitive information in it, but you can override one or more of these variables by defining them directly in the shell before launching docker compose (values in the shell take precedence over those specified in the `.env` file.).

> **Notes for Windows users:**  
> You should set the following environment variable to enable path conversion from Windows-style to Unix-style in volume definitions:   
> `COMPOSE_CONVERT_WINDOWS_PATHS=1`

Once you have customized your environment variables, you can build and start a development environment with the following command:
``` bash
$ make dev
```

This previous command builds all the required services for development and starts them all except the _Django_ web server and workers.

#### _Django_ web server
To start the _Django_ web server, please open a terminal in the container:
``` bash
$ docker exec -it diagho_dev_core_1 /bin/bash
```

Then run:
``` bash
(core) $ cd /code
(core) $ make demo
```

Or run sequentially:
``` bash
(core) $ cd /code
(core) $ make collectstatic
(core) $ make migrations
(core) $ make migrate
(core) $ make populate-db
(core) $ make load-catalog
(core) $ make createsuperuser
(core) $ make runserver
```

#### _Celery_ workers
To start _Celery_ workers, please run in two different terminals:
``` bash
$ docker exec -it diagho_dev_core_1 make -C /code worker-gateway
```
and:
``` bash
$ docker exec -it diagho_dev_core_1 make -C /code worker-computation
```

### Exposed ports when using Docker Compose to run Diagho

| port      | service       | environment variable            | environment   | description                        |
| --------- | ------------- | ------------------------------- | ------------- | ---------------------------------- |
| __8080__  | reverse-proxy | `NGINX_HOST_PORT`               | `dev`, `demo` | NGINX server (Diagho entry point)  |
| 8081      | core          | `CORE_HOST_PORT_DEV`            | `dev`         | Django dev server                  |
| 5672      | broker        | `RABBITMQ_HOST_PORT_DEV`        | `dev`         | RabbitMQ server                    |
| __15672__ | broker        | `RABBITMQ_MANAGEMENT_HOST_PORT` | `dev`, `demo` | RabbitMQ management and monitoring |
| 5432      | core-db       | `POSTGRES_HOST_PORT_DEV`        | `dev`         | PostgreSQL server                  |
| 6379      | cache         | `REDIS_HOST_PORT_DEV`           | `dev`         | PostgreSQL server                  |

## Tech/framework used
- [NGINX](https://www.nginx.com/): a free and open-source web server used as a reverse proxy;
- [Django](https://www.djangoproject.com/): a Python-based free and open-source web framework;
- [Celery](https://docs.celeryproject.org/): Distributed Task Queue for Python;
- [PostgreSQL](https://www.postgresql.org/): a free and open-source relational database management system;
- [RabbitMQ](https://www.rabbitmq.com/): the most widely deployed open source message broker;

## Contributing
For the sake of simplicity, to ease interaction with the community, we use the [Git flow](https://git-flow.readthedocs.io/) for open-source projects. In a few words:
* The `main` branch is always stable and deployable;
* Tags from the `main` branch are considered as releases;
* The `staging` branch is the work-in-progress branch;
* Contributors have to fork or create a new feature-branch to work on (if they are allowed to in the original repository) and propose a pull request to merge their branch to `staging`.

If you'd like to contribute, please raise an issue or fork the repository and use a feature branch. Pull requests are warmly welcome!

## Versioning
We use [SemVer](http://semver.org/) for versioning. See the [CHANGELOG.md](CHANGELOG.md) file for details.

## Licensing
The code in this project is licensed under MIT license. See the [LICENSE](LICENSE) file for details.
