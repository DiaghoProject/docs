# Bonnes pratiques de gestion des mots de passe

Liste des bonnes pratiques générales vis à vis de la gestion des authentifiants.

### Mot de passe

- Mot de passe d'au moins 12 caractères (après fusion des espaces), pouvant atteindre au moins 64 caractères mais ne dépassant pas 128 (risque de DoS)
- Pas de troncation de mot de passe mais de multiples espaces successives sont remplacées en une espace unique (e.g. "alice bob" = "alice&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;bob" ≠ "alicebob")
- **Tous** caractères imprimables Unicode acceptés (y compris Emoji)
- Les utilisateurs peuvent changer de mot de passe. Nécessite de connaître le mot de passe actuel
- Vérifier que le mot de passe choisi est absent des dictionnaires de mots de passe communs et fuités et ne contient pas d'infos liées à l'utilisateur
- Indicateur visuel de l'entropie du mot de passe en cours de saisie lors de sa création
- Pas d'obligation sur le choix de caractères

![XKCD](https://imgs.xkcd.com/comics/password_strength.png)

- Pas de délai d'expiration ni d'historique de mots de passe pour les comptes sans privilège (considéré contreproductif : les utilisateurs choisissent des mots de passe plus faibles et itératifs et/ou les notent quelque part)
- Autoriser la colle de texte dans le champ de mot de passe (permet un usage facilité de coffre-forts)
- Affichage temporaire du mot de passe ou du dernier caractère tapé possible
- Ne pas avoir de comptes par défaut ("root", "admin", "sa"…)

### Récupération de mots de passe

- Décider si le passage par un admin est obligatoire ou si un système automatisé via OTP est possible
- Ne pas utiliser de système de secrets (nom du chien, ville de naissance…)
- Ne pas envoyer un nouveau mot de passe en clair ; ne pas compromettre l'ancien
- Appliquer les mêmes exigences pour un nouveau mot de passe qu'à la création du compte

### Protection

- Protections contre le bruteforce : soft lock à délais croissants (éventuellement, deux hash successifs identiques ne comptent pas comme des essais différents), vitesse humaine entre deux requêtes, IP ban, jamais plus de 100 échecs en une heure…
- Ne pas préciser la cause d'un échec d'authentification ("Adresse email ou mot de passe erroné" au lieu de "utilisateur inconnu"/"mot de passe erroné")
- SMS et mail sont considérés comme de faibles seconds facteurs
- Notifications de sécurité aux utilisateurs (connexion depuis un nouveau device, reset de mot de passe…)
- Toute action liée à l'authentification doit être loguée (connexion réussie, échouée, depuis quelle machine, demande de changement de mot de passe…)
- Avoir un système de révocation générale des mots de passe dans l'hypothèse d'une compromission suspectée ou avérée

### Stockage

- Pas de stockage de mot de passe en clair : hashé et salé avec un algorithme reconnu et correctement configuré (argon2id > scrypt > bcrypt ; memory-hard et avec autant d'itérations que le permet le serveur ; les trois incluent une méthode de salage)  
!!! info
    Par défaut, Django utilise PKDF2 avec SHA256, mais peut gérer argon2, bcrypt et scrypt. Il prévoit également un système de mise à jour auto du hachage des mots de passe déjà existants : en théorie, même en prod, si correctement configuré, il sera possible d'améliorer progressivement la sécurité des comptes sans impact visible par l'utilisateur.
!!! tip "Configurations minimales"
    - PKDF2 : autant d'itérations que le permet le serveur, typiquement au moins 100&nbsp;000 en SHA-256
    - bcrypt : work factor > 10
    - Argon2id : grand minimum `m=37 MiB, t=1, p=1` ou `m=15 MiB, t=2, p=1`
    - scrypt : minimum entre `N=2^16 (64 MiB), r=8 (1024 bytes), p=1` ou `N=2^12 (4 MiB), r=8 (1024 bytes), p=15` selon le tradeoff CPU/mémoire désiré
- Sel d'au moins 32 bits ; un sel unique par utilisateur, stocké hashé

## Gestion des comptes

- Les comptes sont nominatifs (les comptes partagés ou génériques sont interdits)
- Il est possible d’indiquer une date de fin de validité sur chaque compte (facultatif). Si cette date est renseignée, l'utilisateur ne peut plus se connecter passé cette date. Le déblocage ne peut être fait que par un administrateur.

## NB

V. Procaccio propose de partager le travail effectué pour la BDD MitoMap et qui intègre une double authentification.

