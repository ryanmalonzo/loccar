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
   idEntreprise INT NOT NULL,
   role VARCHAR(10) NOT NULL,
   PRIMARY KEY(idUtilisateur),
   FOREIGN KEY(idEntreprise) REFERENCES entreprise(idEntreprise)
);

CREATE TABLE IF NOT EXISTS modele (
	idModele INT AUTO_INCREMENT NOT NULL,
	nomModele VARCHAR(25) NOT NULL,
	caracteristiques VARCHAR(200) NOT NULL,
	photo VARCHAR(200) NOT NULL,
	tarifJournalier INT NOT NULL, 
	PRIMARY KEY(idModele)
);

CREATE TABLE IF NOT EXISTS vehicule (
   idVehicule INT AUTO_INCREMENT,
   idModele INT NOT NULL,   
   etatLocation VARCHAR(50) NOT NULL,
   idUtilisateur INT,
   PRIMARY KEY(idVehicule),
   FOREIGN KEY(idUtilisateur) REFERENCES utilisateur(idUtilisateur),
   FOREIGN KEY(idModele) REFERENCES modele(idModele)
);


CREATE TABLE IF NOT EXISTS facture (
   idUtilisateur INT AUTO_INCREMENT,
   idVehicule INT,
   dateDebut DATE NOT NULL,
   dateFin DATE,
   etatRetour VARCHAR(50) NOT NULL,
   PRIMARY KEY(idUtilisateur, idVehicule),
   FOREIGN KEY(idUtilisateur) REFERENCES utilisateur(idUtilisateur),
   FOREIGN KEY(idVehicule) REFERENCES vehicule(idVehicule)
);

/*Insertion de jeu de données*/

/*Insertion table entreprise*/
INSERT INTO entreprise (adresseEntreprise, nomEntreprise) VALUES ("23 rue de la paix, Rouen 76000","FNAC");
INSERT INTO entreprise (adresseEntreprise, nomEntreprise) VALUES ("56 boulevard Jean Jaurès, Nantes 44010","Nestle");
INSERT INTO entreprise (adresseEntreprise, nomEntreprise) VALUES ("178 avenue des champs, Lyon 69000","Crédit Agricole");
INSERT INTO entreprise (adresseEntreprise, nomEntreprise) VALUES ("8 rue Molière, Marseille 13177","Auchan");
INSERT INTO entreprise (adresseEntreprise, nomEntreprise) VALUES ("44 rue de Versailles, Paris 75014","Loccar");


/*Insertion table utilisateur*/
INSERT INTO utilisateur (nom, pseudo,motDePasse, idEntreprise, role) VALUES ("Dupont", "pierreDupont@fnac.com", "GO/65st$", 1, "client");
INSERT INTO utilisateur (nom, pseudo,motDePasse, idEntreprise, role) VALUES ("Veret", "camilleVeret@fnac.com", "mpd000fnac", 1, "client");
INSERT INTO utilisateur (nom, pseudo,motDePasse, idEntreprise, role) VALUES ("Bizeseul", "marcBizeseul@fnac.com", "Qcx9PQh65", 1, "client");
INSERT INTO utilisateur (nom, pseudo,motDePasse, idEntreprise, role) VALUES ("Lamanac", "amelieLamanac@fnac.com", "8eW4Fp7Wd", 1, "client");

INSERT INTO utilisateur (nom, pseudo,motDePasse, idEntreprise, role) VALUES ("Sauvilliers", "andreSauvilliers@nestle.com", "97w=(7k.g", 2, "client");
INSERT INTO utilisateur (nom, pseudo,motDePasse, idEntreprise, role) VALUES ("Rages", "nathalieRages@nestle.com", "z18EuR0Mv", 2, "client");
INSERT INTO utilisateur (nom, pseudo,motDePasse, idEntreprise, role) VALUES ("Belenteau", "rogerBelenteau@nestle.com", "|!8a>9k2w", 2, "client");
INSERT INTO utilisateur (nom, pseudo,motDePasse, idEntreprise, role) VALUES ("Abanteau", "jeanAbanteau@nestle.com", "3JU2q79fxKrF", 2, "client");

INSERT INTO utilisateur (nom, pseudo,motDePasse, idEntreprise, role) VALUES ("Ranac", "sofiaRanac@creditagricole.com", "Jt3t3QdP3", 3, "client");
INSERT INTO utilisateur (nom, pseudo,motDePasse, idEntreprise, role) VALUES ("Polastel", "arthurPolastel@creditagricole.com", "8>&st48w!", 3, "client");
INSERT INTO utilisateur (nom, pseudo,motDePasse, idEntreprise, role) VALUES ("Jouvechade", "margotJouvechade@creditagricole.com", "oX2cZs2N2", 3, "client");
INSERT INTO utilisateur (nom, pseudo,motDePasse, idEntreprise, role) VALUES ("Pellerdieu", "vincentPellerdieu@creditagricole.com", "334H9BoFbVoy", 3, "client");

INSERT INTO utilisateur (nom, pseudo,motDePasse, idEntreprise, role) VALUES ("Aguelle", "simonAguelle@auchan.com", "ks15QTBu2", 4, "client");
INSERT INTO utilisateur (nom, pseudo,motDePasse, idEntreprise, role) VALUES ("Maiffet", "clarisseMaiffet@auchan.com", "9!:2=pmw7", 4, "client");
INSERT INTO utilisateur (nom, pseudo,motDePasse, idEntreprise, role) VALUES ("Castemoux", "emmaCastemoux@auchan.com", "4S6tgs8QO6Zs", 4, "client");
INSERT INTO utilisateur (nom, pseudo,motDePasse, idEntreprise, role) VALUES ("Dumeur", "mathisDumeur@auchan.com", "Fon7F1Z1j", 4, "client");

INSERT INTO utilisateur (nom, pseudo,motDePasse, idEntreprise, role) VALUES ("Croilon", "georgesCroilon@loccar.com", "e%9^79!pv", 5, "admin");
INSERT INTO utilisateur (nom, pseudo,motDePasse, idEntreprise, role) VALUES ("Bonnevès", "marieBonneves@loccar.com", "pXJzw21b49TM", 5, "admin");
INSERT INTO utilisateur (nom, pseudo,motDePasse, idEntreprise, role) VALUES ("Gailart", "julesGailart@loccar.com", "22+$!zyo1", 5, "admin");
INSERT INTO utilisateur (nom, pseudo,motDePasse, idEntreprise, role) VALUES ("Lomalot", "aurelienLomalot@loccar.com", "H7rZi336NbWn", 5, "admin");

/* Insertion table modele*/
INSERT INTO modele (nomModele, caracteristiques, photo, tarifJournalier) VALUES ("Peugeot 107", "P107.json", "P107.jpg", 112.60);
INSERT INTO modele (nomModele, caracteristiques, photo, tarifJournalier) VALUES ("Peugeot 208", "P208.json", "P208.jpg", 109.45);
INSERT INTO modele (nomModele, caracteristiques, photo, tarifJournalier) VALUES ("Renault Clio IV", "ClioIV.json", "ClioIV.jpg", 123.60);
INSERT INTO modele (nomModele, caracteristiques, photo, tarifJournalier) VALUES ("Dacia Duster", "Duster.json", "Duster.jpg", 137.20);
INSERT INTO modele (nomModele, caracteristiques, photo, tarifJournalier) VALUES ("Volkswagen Polo", "Polo.json", "Polo.jpg", 145.70);
INSERT INTO modele (nomModele, caracteristiques, photo, tarifJournalier) VALUES ("Audi A8", "AA8.json", "AA8.jpg", 176);
INSERT INTO modele (nomModele, caracteristiques, photo, tarifJournalier) VALUES ("Honda Civic", "Civic.json", "Civic.jpg", 148.40);
INSERT INTO modele (nomModele, caracteristiques, photo, tarifJournalier) VALUES ("Toyota Yaris", "Yaris.json", "Yaris.jpg", 129.90);
INSERT INTO modele (nomModele, caracteristiques, photo, tarifJournalier) VALUES ("Lexus NX", "LNX.json", "LNX.jpg", 163.45);
INSERT INTO modele (nomModele, caracteristiques, photo, tarifJournalier) VALUES ("Skoda Fabia", "Fabia.json", "Fabia.jpg", 133.60);
INSERT INTO modele (nomModele, caracteristiques, photo, tarifJournalier) VALUES ("Subaru Outback", "Outback.json", "Outback.jpg", 132.80);
INSERT INTO modele (nomModele, caracteristiques, photo, tarifJournalier) VALUES ("Citroen C3", "CC3.json", "CC3.jpg", 129.40);

/*Insertion table vehicule*/
INSERT INTO vehicule (idModele, etatLocation) VALUES (1,"disponible");
INSERT INTO vehicule (idModele, etatLocation) VALUES (1,"disponible");
INSERT INTO vehicule (idModele, etatLocation) VALUES (1,"disponible");
INSERT INTO vehicule (idModele, etatLocation) VALUES (2,"disponible");
INSERT INTO vehicule (idModele, etatLocation) VALUES (2,"disponible");
INSERT INTO vehicule (idModele, etatLocation) VALUES (3,"disponible");
INSERT INTO vehicule (idModele, etatLocation) VALUES (3,"disponible");
INSERT INTO vehicule (idModele, etatLocation) VALUES (3,"disponible");
INSERT INTO vehicule (idModele, etatLocation) VALUES (3,"disponible");
INSERT INTO vehicule (idModele, etatLocation) VALUES (3,"disponible");
INSERT INTO vehicule (idModele, etatLocation) VALUES (4,"disponible");
INSERT INTO vehicule (idModele, etatLocation) VALUES (4,"disponible");
INSERT INTO vehicule (idModele, etatLocation) VALUES (4,"disponible");
INSERT INTO vehicule (idModele, etatLocation) VALUES (4,"disponible");
INSERT INTO vehicule (idModele, etatLocation) VALUES (5,"disponible");
INSERT INTO vehicule (idModele, etatLocation) VALUES (5,"disponible");
INSERT INTO vehicule (idModele, etatLocation) VALUES (5,"disponible");
INSERT INTO vehicule (idModele, etatLocation) VALUES (6,"disponible");
INSERT INTO vehicule (idModele, etatLocation) VALUES (6,"disponible");
INSERT INTO vehicule (idModele, etatLocation) VALUES (6,"disponible");
INSERT INTO vehicule (idModele, etatLocation) VALUES (6,"disponible");
INSERT INTO vehicule (idModele, etatLocation) VALUES (7,"disponible");
INSERT INTO vehicule (idModele, etatLocation) VALUES (8,"disponible");
INSERT INTO vehicule (idModele, etatLocation) VALUES (8,"disponible");
INSERT INTO vehicule (idModele, etatLocation) VALUES (8,"disponible");
INSERT INTO vehicule (idModele, etatLocation) VALUES (9,"disponible");
INSERT INTO vehicule (idModele, etatLocation) VALUES (9,"disponible");
INSERT INTO vehicule (idModele, etatLocation) VALUES (9,"disponible");
INSERT INTO vehicule (idModele, etatLocation) VALUES (10,"disponible");
INSERT INTO vehicule (idModele, etatLocation) VALUES (11,"disponible");
INSERT INTO vehicule (idModele, etatLocation) VALUES (11,"disponible");
INSERT INTO vehicule (idModele, etatLocation) VALUES (11,"disponible");
INSERT INTO vehicule (idModele, etatLocation) VALUES (12,"disponible");
INSERT INTO vehicule (idModele, etatLocation) VALUES (12"disponible");









