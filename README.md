![car-dealership](./assets/github-repo-logo.svg)

# Location de voitures

[Ce repo](https://github.com/yusa-ai/pweb) contient le code source d'un projet d'application web simulant un contexte de location de voitures pour entreprises. 
De plus amples explications sont données dans [l'énoncé du projet](PWEB%20PROJET%202021.pdf).

Ce projet a été réalisé en suivant l'architecture MVC ([Modèle-vue-contrôleur](https://fr.wikipedia.org/wiki/Mod%C3%A8le-vue-contr%C3%B4leur)) 
et à l'aide des langages PHP/SQL. Les différents écrans ou vues du site ont été créés en utilisant le framework Bootstrap.

## Utilisation

La mise en place de cette application est effectuée en quatre étapes :
* Importation de la base de données (`location_voitures.sql`) sur un serveur MySQL
* Édition du fichier `model/connect.php` concernant les identifiants relatifs à la connexion au serveur de BDD
* Exécution d'un serveur web à la racine du projet
* Ouverture d'`index.php` depuis un navigateur Internet

### Connexion

Les mots de passe sont chiffrés à l'aide de la fonction SHA-1.  
À des fins d'essais, les identifiants sont disponibles en clair dans le fichier `mdpSHA1.xlsx`.  

Aussi, par défaut, tout utilisateur peut créer un compte administrateur (société "Loccar" lors de l'inscription).

## Versions

* PHP : 5.6.40
* MySQL : 5.7.31

## Membres de l'équipe

* MALONZO Ryan
* PESSEY Julie

Groupe 204 (semestre 3)  
Projet PWEB 2021 - 2022 à l'IUT de Paris - Rives de Seine