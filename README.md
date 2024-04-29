# The Gossip Project

The Gossip Project est une application web construite avec Ruby on Rails qui permet aux utilisateurs de partager des potins, de lire des nouvelles et de naviguer entre des profils utilisateurs. C'est un espace où les rumeurs et les nouvelles du jour sont partagées de manière amusante.

## Fonctionnalités
- Partage de potins avec un titre et un contenu.
- Affichage de la liste des potins sur la page d'accueil.
- Affichage des détails des potins individuels.
- Pages de profil pour les utilisateurs.
- Navigation entre les différentes sections de l'application.

## Installation
Suivez ces étapes pour configurer et exécuter le projet sur votre machine locale :

1. **Cloner le dépôt** :
- bash
- git clone https://github.com/votre-utilisateur/the-gossip-project.git
- cd the-gossip-project

2. **Installer les dépendances**
- bundle install

3. **Configurer la base de données**
- rails db:create
- rails db:migrate
- rails db:seed

4. **Démarrer le serveur Rails**
- rails server

5. **Accéder à l'application**
- Ouvrez votre navigateur et allez sur http://localhost:3000