# Organisation du projet

## Diagho Project

Les différentes applications du projet

- [Docs private](https://github.com/DiaghoProject/docs-private): Documentation privée du projet
- [Docs public](https://github.com/DiaghoProject/docs): Documentation public du projet
- [Diagho core](https://github.com/DiaghoProject/diagho-core): Noyau de l'application divisé en microservices
- [Diagho Hugo Prod](https://github.com/DiaghoProject/diagho-hugo-prod): Mise sur en ligne de l'application sur Demo
- [Diagho vep](https://github.com/DiaghoProject/diagho-vep): Microservice pour gérer les annotations VEP
- [Diagho Biodb](https://github.com/DiaghoProject/diagho-biodb): En cours de création, microservice pour gérer automatiquement les fichiers de la base de donnée


## Architecture

L'architecture du projet se structure en 3 niveaux

- Organisation Microservice
    - Applications Django
        - Application `primaire`
        - Application `factory`
        - Application `analyse`

### Organisation Microservice

Les différents mircroservices sont conteneurisés avec Docker  

- reverse-proxy (Nginx)
- core (Application Django)
    - Volume: static, media et biodb
- core-db (Base de données PostgreSQL)
    - Volume: core-db-data
- broker (RabbitMQ)
    - Worker: worker-gateway, worker-computation, scheduler
    - Volume: broker-data
- cache (Redis)
    - Volume: cache-data
- front (Node.js / Webpack)
    - Volume: static


## Lancer un projet

- Makefile --> Les différents raccourcis pour lancer les commandes python
- docker-compose.yml --> Gestion des containers prod
- docker_compose.dev.yml --> Gestion des containers dev
- /services/backend --> Les différentes applications du back
- /services/frontend --> Les différentes application du front
- /services/reverse-proxy --> Paramètrage des serveux web

Les différents services sont 

| Services           |          | Diagho core        | Diagho Hugo Prod   |
| ------------------ | -------- | ------------------ | ------------------ |
| core               | django   | :x:                | :heavy_check_mark: |
| core_db            | postgres | :heavy_check_mark: | :x:                |
| reverse-proxy      | Nginx    | :heavy_check_mark: | :heavy_check_mark: |
| frontend           | Nodejs   | :heavy_check_mark: | :x:                |
| worker-gateway     | -        | :x:                | :heavy_check_mark: |
| worker-computation | -        | :x:                | :heavy_check_mark: |
| scheduler          | -        | :x:                | :heavy_check_mark: |
| vep                | -        | :x:                | :heavy_check_mark: |
| RabbitMQ           | -        | :x:                | :heavy_check_mark: |
| Redis              | -        | :x:                | :heavy_check_mark: |

## Variables d'environnement

- /.env --> La liste des variables d'environnement pour le projet 

Pour modifier un port avant de faire le make dev, il faut le spécifier avant la commande 

```
$ CORE_PORT=18080 make dev
```

#### Back-end

Dans le conteneur diagho-core /services/backend, pour initialiser l'environnement

``` bash
$ make requirements
$ make install-dev
$ make migrations
$ make migrate
$ make createsuperuser
$ make collectstatic
$ make populate-db
$ make load-catalog
$ make runserver # Check that all is working

```

## Workflow GitHub

- main --> Branche équivalente à la prod
- staging --> Environment stable. N'accepte que les pull requests de la branche dev
- dev --> Environnement de développement. Les commits directs sont à éviter.
- feature --> Branche qui va être créée pour chaque nouvelle feature et on merge sur dev 

1- Créer une nouvelle branche 'feature' avec un nom descriptif

2- Toujours ouvrir une pull request vers dev lorsque l'on créé une nouvelle branche 'feature' (Sur l'interface github)

3- Faire un rebase sur la branche 'feature' lorsqu'il y a eu des modifications sur dev, et faire un push (CLI)

4- Lorsque le code est terminé on fait une demande de review (Sur l'interface github)

5- Faire un Squash and merge de la branche feature sur staging et supprimer la branche 'feature' (Sur l'interface github) 

## Coding Style

- Black --> Reformate le code 

## Biodb

Pour créer le volume biodb-data-dev :

``` 
docker volume create --name biodb-data-dev --opt type=none --opt device=media/data/diagho-prod/biodb --opt o=bind
```

En remplaçant /media/data/diagho-prod/biodb par le chemin qui vous arrange.

Pour télécharger le fichier biodb: 

https://cdn.discordapp.com/attachments/886948473964990475/1028964672906481734/catalog.json


## Communication

- Discord 
- [Diagho Private Docs](https://private.diagho.com/)
- [Diagho Documentation](https://docs.diagho.com/)

