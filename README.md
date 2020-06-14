# AIRBATIMENT

## Présentation

Avant de construire une maison ou un bien immobilier, on réalise une multitude de recherche sur les étapes de construction, les professionnels du bâtiment (réallisation, notation, compétence, etc...), la composition du bâtiment (isolation, ventilation, fenêtre, etc....) et surtout le coût. Et pour éviter de se faire arnaquer ou tomber sur des gens malhonnête, on récolte des infos par le bouche à oreille, sans forcément obtenir toutes les informations utiles pour la construction de son bien.

Le site internet (avec app) doit permettre de mettre en relation une personne qui souhaite construire (futur maître d'ouvrage = P1) et une personne ayant déjà construit (ancien maître d'ouvrage = P2). En échange d'une somme d'argent, P2 réalise une visite de son bien et communique toutes les informations de son bien (contructeurs / matériaux / et...). Une fois la visite réalisé, P1 et P2 se note mutuellement. Il est également possible d'ajouter quelques unes des fonctionnalités de airbnb.

Le site ne permet ni de vendre, ni de louer un bien. Il met juste en relation un ancien et un futur maître d'ouvrage (personne pour qui est réalisé le projet de construction)

## Visite en ligne https://airbatiment.herokuapp.com/

# Installation en local
**Configuration**
Entrez les commandes suivantes dans votre terminal préféré :

git clone git@github.com:AlbayrakSanli/airbatiment.git

`cd airbatiment`

``bundle install``

**Database creation**

`rails db:create`

`rails db:migrate`

**Database initialisation**

`rails db:seed`

## Connexion au site

`rails server`

Une fois le server connecté, rendez-vous sur :

http://localhost:3000/

## Auteurs

ALBAYRAK Furkan

HALLER Jérémy

LAM Liedel
