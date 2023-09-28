# Écran de connexion

C'est l'écran d'accueil pour un utilisateur non authentifié

[![Ecran de connexion](/images/mockup/connect.png)](/images/mockup/connect.png)

### Actions
- Formulaire de connexion
- Demander une réinitialisation de mot de passe
- Accéder au formulaire de [création de compte](./signup.md)
- Accéder à la documentation, mentions légales et formulaire de contact

### Informations
- Version de Diagho

## Formulaire de connexion
### Champs
- Menu déroulant : Choix de l'instance (CHU Rennes, CHU Angers, environnement de test…)
- Texte court : Nom d'utilisateur/adresse email
- Texte court : Mot de passe

### Fonctionnalités
- Afficher/masquer mot de passe
- Autoriser le collage dans les champs (max 128 caractères)
- En cas d'erreur, ne pas renseigner qui de l'identifiant ou du mot de passe est erroné.
- Gestion du soft lock : en cas d'erreurs répétées impose un délai avant de pouvoir retenter une connexion

Plus de détails dans [les bonnes pratiques](/functional_specification/features/passwords) sur la gestion des mots de passe.
