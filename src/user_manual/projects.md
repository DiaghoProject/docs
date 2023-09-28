# Les projets

Les projets servent de cadre dans lesquels les analyses sont lancées. Ils ont plusieurs fonctions :  

- Laisser les LBM libre de choisir l'organisation de leurs analyses
- Permettre une gestion des droits d'accès aux analyses
- Permettre l'application d'annotations, filtres et visualisation par défaut aux analyses lancées en leur sein

???+ example "Cas d'usage"
    === "Exemple 1"
        ```
        Indication_1/
        └── [analyses]
        Indication_2/
        └── [analyses]
        Indication_3/  
        └── [analyses]
        Indication_4/
        └── [analyses]
        ```

    === "Exemple 2"
        ```
        Indication_1/  
        ├── Pierre/  
        |    └── [analyses]
        ├── Paul/
        |    └── [analyses]
        └── Jacques
             └── [analyses]  
        Indication_2/  
        ├── Riri/  
        |    └── [analyses]
        ├── Fifi/
        |    └── [analyses]
        └── Loulou
             └── [analyses]  
        ```

    === "Exemple 3"
        ```
        Constitutionnelle/  
        ├── Indication_1/  
        |    ├── 2022/
        |    |    └── [analyses]
        |    └── 2023
        |         └── [analyses] 
        └── Indication_2/  
             ├── 2022/  
             |    └── [analyses]
             └── 2023/
                  └── [analyses]
        Somatique/
        └── [etc]
        Recherche/
        └── [etc]
        ```

    Ces simples exemples d'arborescences suffisent à illustrer les deux autres buts des projets : deux indications n'auront pas nécessairement besoin des mêmes annotations voire ne relèveront même pas de la même discipline.  
    De même, si certains LBM n'ont pas de remord à laisser tout accessible à tout le monde, certains voudront peut-être mettre en place une gestion des droits plus restrictive, notamment dans le cadre de la recherche, ne serait-ce que pour éviter de polluer les listings des utilisateurs avec des analyses qui ne les concernent pas.


## Concept général
![Projects](/images/projects.png)

Au même titre qu'un individu appartient nécessairement à une famille, une analyse doit nécessairement appartenir à un projet. Ainsi, si un utilisateur n'a pas les droits d'accès à un projet, il sera possible de lui masquer les analyses associées.

Plusieurs analyses peuvent cependant être faites depuis un même sample et ce dans des projets différents.

## Informations du modèle Projet
- Créateur du projet
- Date de création
- Projet parent (optionnel)
- Thématique : constitutionnelle, somatique, recherche, mixte (optionnel ?)
    - Laisser la possibilité de créer les siens ?
    - Possibilité de les cumuler ? → labels plus que thématiques
    - Booléen diagnostique/non ? → choix des statuts d'analyses
- Groupes d'utilisateurs ayant droits de lecture (tout le monde par défaut)
- Groupes d'utilisateurs ayant droits d'édition (créateur + admins par défaut)
- Commentaire (champs libre type README)(optionnel)
- Annotation/filtrage par défaut (optionnel)
- Autorisation de lancer une analyse avec une annotation/filtrage personnalisé (oui par défaut)
- Uploader un fichier (optionnel)

## Informations dérivables d'un projet
- Nombre d'analyses
- Nombre d'individus
- Nombre de collaborateurs
- Date de dernière modification
- Date de dernière analyse ajoutée
- Date de dernière analyse lancée
- Audit trail (nouvelle analyse, interprétation rendue…)

