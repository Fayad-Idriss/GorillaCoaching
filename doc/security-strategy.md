# Stratégie de sécurisation

## Introduction

Je vous présente ma stratégie de sécurisation de l’application GorillaCoaching. Pour ce faire, j’ai décidé de diviser l’application en plusieurs couches que je vais sécuriser indépendamment les unes des autres grâce à des principes comme la défense en profondeur. Nous aurons trois couches : la partie client, la partie API et la partie BDD.


## Client 

### HTTPS

Nous allons tout d’abord utiliser le HTTPS pour assurer la confidentialité et l’intégrité des informations échangées, ainsi que l’authenticité du serveur contacté.

L’absence de cette garantie peut entraîner de nombreux abus sans pour autant que l’intention soit malveillante. Par exemple, certains hotspots Wi-Fi publics insèrent, à l’insu de l’utilisateur, du contenu publicitaire ou des informations annexes dans les pages provenant de sites en HTTP.

Ce protocole garantit également l’intégrité et la confidentialité des données échangées en bloquant les attaques de type Man-In-The-Middle (écoute, interception ou modification des échanges à la volée par des tiers, à l’insu de l’utilisateur).


### SOP 

L’objectif de la Same-Origin Policy (SOP) est de fournir un cadre de contrôle des interactions pouvant être effectuées par les éléments embarqués dans une page web. La SOP est une contrainte implémentée par tous les navigateurs du marché. Cette contrainte ne signifie pas que toutes les ressources doivent provenir d’une même origine, mais elle impose des restrictions dans la communication entre composants lorsque ceux-ci ont des origines différentes.

### CORS

Il est parfois nécessaire de contourner la SOP (stratégie de sécurité par défaut du navigateur) afin de permettre l’appel de ressources en dehors de l’origine, comme celles fournies par des services web tiers de météo ou d’actualités, par exemple.


### Sanitization des formulaires (regex)

Nous allons utiliser des expressions régulières (regex) pour vérifier que les données fournies par les utilisateurs sont bien conformes au format attendu avant d’envoyer les éléments à la base de données.

#### Vérification des mots des passe

#### Se prémunir contre les injections SQL 


## API

Pour la partie API, en plus de la stratégie de sécurisation, nous allons appliquer le principe de moindre privilège. Ce principe vise à n’octroyer aux éléments et acteurs du système que les permissions strictement nécessaires pour fonctionner, afin de limiter le risque de vol, d’altération ou de destruction de données en cas de compromission d’un ou plusieurs éléments.


### Encodage des reponses avec XMLHttpRequest

Pour éviter certaines vulnérabilités XSS, il est donc préférable d’utiliser un format d’encodage et non un fragment HTML. Dans notre cas, nous utiliserons JSON ou XML.


### Requête préparée

Nous utiliserons XHR pour les méthodes POST, PUT et GET sous certaines conditions :

- si elles comportent seulement des données publiques dans leurs URLs.
- à des fins de récupération de données non sensibles (conservables dans un cache).
- à la condition de ne provoquer aucun traitement persistant ou changement d’état côté serveur.


### Durée de session 

Pour cette application j'ai décider d'imposer une durée de session off de 10min avant la demande reconnexion.


### Authentification 

Au niveeau de l'Authentification nous avons décider d'instaurer une authentification multifacteur pour couvrir les deux catégories 
- Ce que je sais.
- Ce que je suis.


## Base de données


### Politique des mots de passe

- Le mot de passe requiert au minimun 8 caractères.
- Le mot de passe dois avoir un caractère spéciale.
- L'utilisateur n'aura le droit que à 4 tentative de connexion.
- Hachage et salage des mots de passe.  



