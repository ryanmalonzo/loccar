/*Creation des tables de la base*/

CREATE TABLE IF NOT EXISTS entreprise (
   idEntreprise INT AUTO_INCREMENT,
   adresseEntreprise VARCHAR(50) NOT NULL,
   nomEntreprise VARCHAR(50),
   PRIMARY KEY(idEntreprise)
);

CREATE TABLE IF NOT EXISTS utilisateur (
   idUtilisateur INT AUTO_INCREMENT,
   nom VARCHAR(50) NOT NULL,
   pseudo VARCHAR(30) NOT NULL,
   motDePasse VARCHAR(30) NOT NULL,
   role VARCHAR(10) NOT NULL;
   idEntreprise INT NOT NULL,
   PRIMARY KEY(idUtilisateur),
   FOREIGN KEY(idEntreprise) REFERENCES entreprise(idEntreprise)
);

CREATE TABLE IF NOT EXISTS vehicule (
   idVehicule INT AUTO_INCREMENT,
   modele VARCHAR(50) NOT NULL,
   caracteristiques VARCHAR(200) NOT NULL,
   photo VARCHAR(200) NOT NULL,
   etatLocation VARCHAR(50) NOT NULL,
   idUtilisateur INT,
   PRIMARY KEY(idVehicule),
   FOREIGN KEY(idUtilisateur) REFERENCES utilisateur(idUtilisateur)
);

CREATE TABLE IF NOT EXISTS facture (
   idUtilisateur INT AUTO_INCREMENT,
   idVehicule INT,
   idEntreprise INT,
   dateDebut DATE NOT NULL,
   dateFin DATE,
   etatRetour VARCHAR(50) NOT NULL,
   PRIMARY KEY(idUtilisateur, idVehicule, idEntreprise),
   FOREIGN KEY(idUtilisateur) REFERENCES utilisateur(idUtilisateur),
   FOREIGN KEY(idVehicule) REFERENCES vehicule(idVehicule),
   FOREIGN KEY(idEntreprise) REFERENCES entreprise(idEntreprise)
);

/*Insertion de jeu de données*/

/*Insertion table entreprise*/
INSERT INTO entreprise (adresseEntreprise, nomEntreprise) VALUES ("23 rue de la paix, Rouen 76000","FNAC");
INSERT INTO entreprise (adresseEntreprise, nomEntreprise) VALUES ("56 boulevard Jean Jaurès, Nantes 44010","Nestle");
INSERT INTO entreprise (adresseEntreprise, nomEntreprise) VALUES ("178 avenue des champs, Lyon 69000","Crédit Agricole");
INSERT INTO entreprise (adresseEntreprise, nomEntreprise) VALUES ("8 rue Molière, Marseille 13177","Auchan");
INSERT INTO entreprise (adresseEntreprise, nomEntreprise) VALUES ("44 rue de Versailles, Paris 75014","Loccar");


/*Insertion table utilisateur*/
INSERT INTO utilisateur (nom, pseudo,motDePasse, idEntreprise) VALUES ("Dupont", "pierreDupont@fnac.com", "GO/65st$", 1, "client");
INSERT INTO utilisateur (nom, pseudo,motDePasse, idEntreprise) VALUES ("Veret", "camilleVeret@fnac.com", "mpd000fnac", 1, "client");
INSERT INTO utilisateur (nom, pseudo,motDePasse, idEntreprise) VALUES ("Bizeseul", "marcBizeseul@fnac.com", "Qcx9PQh65", 1, "client");
INSERT INTO utilisateur (nom, pseudo,motDePasse, idEntreprise) VALUES ("Lamanac", "amelieLamanac@fnac.com", "8eW4Fp7Wd", 1, "client");

INSERT INTO utilisateur (nom, pseudo,motDePasse, idEntreprise) VALUES ("Sauvilliers", "andreSauvilliers@nestle.com", "97w=(7k.g", 2, "client");
INSERT INTO utilisateur (nom, pseudo,motDePasse, idEntreprise) VALUES ("Rages", "nathalieRages@nestle.com", "z18EuR0Mv", 2, "client");
INSERT INTO utilisateur (nom, pseudo,motDePasse, idEntreprise) VALUES ("Belenteau", "rogerBelenteau@nestle.com", "|!8a>9k2w", 2, "client");
INSERT INTO utilisateur (nom, pseudo,motDePasse, idEntreprise) VALUES ("Abanteau", "jeanAbanteau@nestle.com", "3JU2q79fxKrF", 2, "client")

INSERT INTO utilisateur (nom, pseudo,motDePasse, idEntreprise) VALUES ("Ranac", "sofiaRanac@creditagricole.com", "Jt3t3QdP3", 3, "client");
INSERT INTO utilisateur (nom, pseudo,motDePasse, idEntreprise) VALUES ("Polastel", "arthurPolastel@creditagricole.com", "8>&st48w!", 3, "client");
INSERT INTO utilisateur (nom, pseudo,motDePasse, idEntreprise) VALUES ("Jouvechade", "margotJouvechade@creditagricole.com", "oX2cZs2N2", 3, "client");
INSERT INTO utilisateur (nom, pseudo,motDePasse, idEntreprise) VALUES ("Pellerdieu", "vincentPellerdieu@creditagricole.com", "334H9BoFbVoy", 3, "client");

INSERT INTO utilisateur (nom, pseudo,motDePasse, idEntreprise) VALUES ("Aguelle", "simonAguelle@auchan.com", "ks15QTBu2", 4, "client");
INSERT INTO utilisateur (nom, pseudo,motDePasse, idEntreprise) VALUES ("Maiffet", "clarisseMaiffet@auchan.com", "9!:2=pmw7", 4, "client");
INSERT INTO utilisateur (nom, pseudo,motDePasse, idEntreprise) VALUES ("Castemoux", "emmaCastemoux@auchan.com", "4S6tgs8QO6Zs", 4, "client");
INSERT INTO utilisateur (nom, pseudo,motDePasse, idEntreprise) VALUES ("Dumeur", "mathisDumeur@auchan.com", "Fon7F1Z1j", 4, "client");

INSERT INTO utilisateur (nom, pseudo,motDePasse, idEntreprise) VALUES ("Croilon", "georgesCroilon@loccar.com", "e%9^79!pv", 5, "admin");
INSERT INTO utilisateur (nom, pseudo,motDePasse, idEntreprise) VALUES ("Bonnevès", "marieBonneves@loccar.com", "pXJzw21b49TM", 5, "admin");
INSERT INTO utilisateur (nom, pseudo,motDePasse, idEntreprise) VALUES ("Gailart", "julesGailart@loccar.com", "22+$!zyo1", 5, "admin");
INSERT INTO utilisateur (nom, pseudo,motDePasse, idEntreprise) VALUES ("Lomalot", "aurelienLomalot@loccar.com", "H7rZi336NbWn", 5, "admin");


/*Insertion table vehicule*/
INSERT INTO vehicule (modele, caracteristiques, photo, etatLocation) VALUES ("Peugeot 107", "P107.json", "P107.png", "disponible");
INSERT INTO vehicule (modele, caracteristiques, photo, etatLocation) VALUES ("Peugeot 208", "P208.json", "P208.png", "disponible");
INSERT INTO vehicule (modele, caracteristiques, photo, etatLocation) VALUES ("Renault Clio IV", "ClioIV.json", "ClioIV.png", "disponible");
INSERT INTO vehicule (modele, caracteristiques, photo, etatLocation) VALUES ("Dacia Duster", "Duster.json", "Duster.png", "disponible");
INSERT INTO vehicule (modele, caracteristiques, photo, etatLocation) VALUES ("Volkswagen Polo", "Polo.json", "Polo.png", "disponible");
INSERT INTO vehicule (modele, caracteristiques, photo, etatLocation) VALUES ("Audi A8", "AA8.json", "AA8.png", "disponible");
INSERT INTO vehicule (modele, caracteristiques, photo, etatLocation) VALUES ("Honda Civic", "Civic.json", "Civic.png", "disponible");
INSERT INTO vehicule (modele, caracteristiques, photo, etatLocation) VALUES ("Toyota Yaris", "Yaris.json", "Yaris.png", "disponible");
INSERT INTO vehicule (modele, caracteristiques, photo, etatLocation) VALUES ("Lexus NX", "LNX.json", "LNX.png", "disponible");
INSERT INTO vehicule (modele, caracteristiques, photo, etatLocation) VALUES ("Skoda Fabia", "Fabia.json", "Fabia.png", "disponible");
INSERT INTO vehicule (modele, caracteristiques, photo, etatLocation) VALUES ("Subaru Outback", "Outback.json", "Outback.png", "disponible");
INSERT INTO vehicule (modele, caracteristiques, photo, etatLocation) VALUES ("Citroen C3", "CC3.json", "CC3.png", "disponible");














