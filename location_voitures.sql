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
INSERT INTO entreprise (adresseEntreprise, nomEntreprise) VALUES ("44 rue de Versailles, Paris 75014","Loccar");

INSERT INTO entreprise (adresseEntreprise, nomEntreprise) VALUES ("23 rue de la paix, Rouen 76000","FNAC");
INSERT INTO entreprise (adresseEntreprise, nomEntreprise) VALUES ("56 boulevard Jean Jaurès, Nantes 44010","Nestle");
INSERT INTO entreprise (adresseEntreprise, nomEntreprise) VALUES ("178 avenue des champs, Lyon 69000","Crédit Agricole");
INSERT INTO entreprise (adresseEntreprise, nomEntreprise) VALUES ("8 rue Molière, Marseille 13177","Auchan");


/*Insertion table utilisateur*/
INSERT INTO utilisateur (nom, pseudo,motDePasse, idEntreprise, role) VALUES ("Croilon", "georgesCroilon@loccar.com", "4da51a44c35d322dea8f10814e5d7982da042e4c", 1, "admin");
INSERT INTO utilisateur (nom, pseudo,motDePasse, idEntreprise, role) VALUES ("Bonnevès", "marieBonneves@loccar.com", "7aa3b386286afe44d911c423f656032e7b12c73d", 1, "admin");
INSERT INTO utilisateur (nom, pseudo,motDePasse, idEntreprise, role) VALUES ("Gailart", "julesGailart@loccar.com", "5c67392b820cadfb4455341af38e4b2a86a36fae", 1, "admin");
INSERT INTO utilisateur (nom, pseudo,motDePasse, idEntreprise, role) VALUES ("Lomalot", "aurelienLomalot@loccar.com", "f1fb385e41bce5eacdedc26d6ccd6a355c1d0304", 1, "admin");

INSERT INTO utilisateur (nom, pseudo,motDePasse, idEntreprise, role) VALUES ("Dupont", "pierreDupont@fnac.com", "874c61a868d340abcb122d1af95d03a86aa9e0f2", 2, "client");
INSERT INTO utilisateur (nom, pseudo,motDePasse, idEntreprise, role) VALUES ("Veret", "camilleVeret@fnac.com", "8ff895888755d95f1d0cfb7f64fbfbb463b619ee", 2, "client");
INSERT INTO utilisateur (nom, pseudo,motDePasse, idEntreprise, role) VALUES ("Bizeseul", "marcBizeseul@fnac.com", "80773d1823dd81137b3c2fe1de30dfd6b1737581", 2, "client");
INSERT INTO utilisateur (nom, pseudo,motDePasse, idEntreprise, role) VALUES ("Lamanac", "amelieLamanac@fnac.com", "3598ee95f2a5c305d41c5e1afba1a54b732e39bd", 2, "client");

INSERT INTO utilisateur (nom, pseudo,motDePasse, idEntreprise, role) VALUES ("Sauvilliers", "andreSauvilliers@nestle.com", "9d58fa906195df97bb06058a57feea8f9cdd2f1d", 3, "client");
INSERT INTO utilisateur (nom, pseudo,motDePasse, idEntreprise, role) VALUES ("Rages", "nathalieRages@nestle.com", "36392d4b06c6aa89e527447a4c438d62f0203a63", 3, "client");
INSERT INTO utilisateur (nom, pseudo,motDePasse, idEntreprise, role) VALUES ("Belenteau", "rogerBelenteau@nestle.com", "5739f57391e13644f87d85bbcd2fbe9b82915a45", 3, "client");
INSERT INTO utilisateur (nom, pseudo,motDePasse, idEntreprise, role) VALUES ("Abanteau", "jeanAbanteau@nestle.com", "1461b927f06c5fe8d45d9d0b30ec2aa8247f2146", 3, "client");

INSERT INTO utilisateur (nom, pseudo,motDePasse, idEntreprise, role) VALUES ("Ranac", "sofiaRanac@creditagricole.com", "1767c7e247bfd57d48c1fbabbd584f47263c31e2", 4, "client");
INSERT INTO utilisateur (nom, pseudo,motDePasse, idEntreprise, role) VALUES ("Polastel", "arthurPolastel@creditagricole.com", "3d53590294f5846b3b171df31a72737c079725a1", 4, "client");
INSERT INTO utilisateur (nom, pseudo,motDePasse, idEntreprise, role) VALUES ("Jouvechade", "margotJouvechade@creditagricole.com", "26e8986c68d621898ee1a9936978f24b8af416c1", 4, "client");
INSERT INTO utilisateur (nom, pseudo,motDePasse, idEntreprise, role) VALUES ("Pellerdieu", "vincentPellerdieu@creditagricole.com", "d58eb8c9ce69be11afb9ac8001edca8e8128c028", 4, "client");

INSERT INTO utilisateur (nom, pseudo,motDePasse, idEntreprise, role) VALUES ("Aguelle", "simonAguelle@auchan.com", "0e7e0ac1801f3be57d4fe7f28eadb10389ca56b7", 5, "client");
INSERT INTO utilisateur (nom, pseudo,motDePasse, idEntreprise, role) VALUES ("Maiffet", "clarisseMaiffet@auchan.com", "bf0dbda06a47bee21f123f4e41cd933eb0693927", 5, "client");
INSERT INTO utilisateur (nom, pseudo,motDePasse, idEntreprise, role) VALUES ("Castemoux", "emmaCastemoux@auchan.com", "371f900c78b47c8f7e7f849cf29b143c5c3ff175", 5, "client");
INSERT INTO utilisateur (nom, pseudo,motDePasse, idEntreprise, role) VALUES ("Dumeur", "mathisDumeur@auchan.com", "e2509805892ecf78e3870368286e48cc30a68d96", 5, "client");

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
INSERT INTO vehicule (idModele, etatLocation) VALUES (12,"disponible");









