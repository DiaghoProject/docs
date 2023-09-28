# Netdata
__Netdata__ est un outil open source conçu pour collecter des mesures en temps réel, telles que l'utilisation du processeur, l'activité du disque, l'utilisation de la bande passante, les visites de sites Web, etc., puis les afficher dans des graphiques en direct et faciles à interpréter.

## Installation

Télécharger le script d'installation, le rendre exécutable et le lancer :
``` bash
$ wget https://my-netdata.io/kickstart.sh
$ chmod +x kickstart.sh
$ ./kickstart.sh
```

## Usage

Créer un tunnel ssh :
``` bash
$ ssh -L 19999:localhost:19999 user@51.91.80.58
```

Puis ouvrir l'adresse [http://localhost:19999](http://localhost:19999) dans votre navigateur préféré !

## Ressources
- [Netdata - Monitor everything in real time for free with Netdata](https://www.netdata.cloud/)
