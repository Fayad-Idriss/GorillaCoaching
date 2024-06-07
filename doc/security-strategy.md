# Stratégie de sécurisation


## Introduction

Je vous présente ma stratégie de sécurisation de l’application GorillaCoaching. Pour ce faire, j’ai décidé de diviser l’application en plusieurs couches que je vais sécuriser indépendamment les unes des autres grâce à des principes comme la défense en profondeur. Nous aurons trois couches : la partie client, la partie API et la partie BDD.


## Client 


### HTTPS

Nous allons tout d’abord utiliser le HTTPS pour assurer la confidentialité et l’intégrité des informations échangées, ainsi que l’authenticité du serveur contacté.

L’absence de cette garantie peut entraîner de nombreux abus sans pour autant que l’intention soit malveillante. Par exemple, certains hotspots Wi-Fi publics insèrent, à l’insu de l’utilisateur, du contenu publicitaire ou des informations annexes dans les pages provenant de sites en HTTP.

Ce protocole garantit également l’intégrité et la confidentialité des données échangées en bloquant les attaques de type Man-In-The-Middle (écoute, interception ou modification des échanges à la volée par des tiers, à l’insu de l’utilisateur).

### CORS

Il est parfois nécessaire de contourner la SOP (stratégie de sécurité par défaut du navigateur) afin de permettre l’appel de ressources en dehors de l’origine, comme celles fournies par des services web tiers de météo ou d’actualités, par exemple.

### Sanitization des formulaires (regex)

Nous allons utiliser des expressions régulières (regex) pour vérifier que les données fournies par les utilisateurs sont bien conformes au type de donnée attendu avant d’envoyer les éléments à la base de données.

   #### Vérification des mots des passe

   Pour la vérification des mots de passe nous utiliserons des regex qui controllerons la longueur minimale et maximale ainsi que la complexités.

   #### Se prémunir contre les injections SQL  

   Nous utiliserons un outils JavaScript " Validator.JS " pour valider et assainir les entrées utilisateur.


## API


### Moindre Privilège 

Ce principe vise à n’octroyer aux éléments et acteurs du système que les permissions strictement nécessaires pour fonctionner, ceci afin de limiter le risque de vol, d’altération ou de destruction de données dans le cas de compromission d’un ou plusieurs éléments.

### Encodage des reponses avec XMLHttpRequest

Pour éviter certaines vulnérabilités XSS, il est donc préférable d’utiliser un format d’encodage et non un fragment HTML. Dans notre cas, nous utiliserons JSON ou XML.

### Durée de session 

Nous allons donner une durée de session limitée estimée à 30 min d'inactivités ainsi qu'un renouvellement de session obligatoire de 8h avant de forcer une reconnexion.
  
   #### Token

   Nous allons utiliser un token pour vérifier l’identité d’un utilisateur ou l’intégrité d’une transaction. Il est souvent utilisé pour sécuriser les interactions entre un client (comme un navigateur web ou une application mobile) et un serveur.


   #### JWT

   Nous allons utiliser Les JWT pour l’authentification et l’autorisation. Après authentification, un JWT est généré et envoyé au  client, qui le présente à chaque requête pour prouver son identité et ses permissions.


### Authentification 

Au niveeau de l'Authentification nous avons décider d'instaurer une authentification multifacteur pour couvrir les deux catégories 
- Ce que je sais.
- Ce que je suis.


## Base de données


### RGPD

Nous utiliserons le RGPD pour imposer des obligations strictes concernant la collecte, le stockage, le traitement et la protection des données personnelles.

- Protection des données dès la conception.
- Sécurité des données.
- Contrôle d'accès et authentification.
- Audit et traçabilités.

### Politique des mots de passe

- Le mot de passe requiert au minimun 8 caractères.
- Le mot de passe dois avoir un caractère spéciale.
- L'utilisateur n'aura le droit que à 4 tentative de connexion.
- Hachage et salage des mots de passe.  


### Les ORM

Nos requêtes préparées seront gérées par des ORM.
