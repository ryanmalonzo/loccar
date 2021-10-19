/*Creation des tables de la base*/

CREATE TABLE IF NOT EXISTS entreprise (
   idEntreprise INT AUTO_INCREMENT,
   adresseEntreprise VARCHAR(50) NOT NULL,
   nomEntreprise VARCHAR(50),
   PRIMARY KEY(idEntreprise)
);

CREATE TABLE IF NOT EXISTS client (
   idClient INT AUTO_INCREMENT,
   nom VARCHAR(50) NOT NULL,
   pseudo VARCHAR(30) NOT NULL,
   motDePasse VARCHAR(30) NOT NULL,
   idEntreprise INT NOT NULL,
   PRIMARY KEY(idClient),
   FOREIGN KEY(idEntreprise) REFERENCES entreprise(idEntreprise)
);

CREATE TABLE IF NOT EXISTS vehicule (
   idVehicule INT AUTO_INCREMENT,
   modele VARCHAR(50) NOT NULL,
   caracteristiques VARCHAR(200) NOT NULL,
   photo VARCHAR(200) NOT NULL,
   etatLocation VARCHAR(50) NOT NULL,
   idClient INT,
   PRIMARY KEY(idVehicule),
   FOREIGN KEY(idClient) REFERENCES client(idClient)
);

CREATE TABLE IF NOT EXISTS facture (
   idClient INT AUTO_INCREMENT,
   idVehicule INT,
   idEntreprise INT,
   dateDebut DATE NOT NULL,
   dateFin DATE,
   etatRetour VARCHAR(50) NOT NULL,
   PRIMARY KEY(idClient, idVehicule, idEntreprise),
   FOREIGN KEY(idClient) REFERENCES client(idClient),
   FOREIGN KEY(idVehicule) REFERENCES vehicule(idVehicule),
   FOREIGN KEY(idEntreprise) REFERENCES entreprise(idEntreprise)
);

/*Insertion de jeu de données*/

/*Insertion table entreprise*/
INSERT INTO entreprise (adresseEntreprise, nomEntreprise) VALUES ("23 rue de la paix, Paris 75014","FNAC");
INSERT INTO entreprise (adresseEntreprise, nomEntreprise) VALUES ("56 boulevard Jean Jaurès, Nantes 44010","Nestle");
INSERT INTO entreprise (adresseEntreprise, nomEntreprise) VALUES ("178 avenue des champs, Lyon 69000","Crédit Agricole");
INSERT INTO entreprise (adresseEntreprise, nomEntreprise) VALUES ("8,","");




/*Insertion table client*/
INSERT INTO client (nom, pseudo,motDePasse, idEntreprise) VALUES ("Dupont", "pierreDupont@fnac.com", "GO/65st$", 1);



/*Insertion table vehicule*/
INSERT INTO vehicule (modele, caracteristiques, photo, etatLocation) VALUES ("Peugeot 107", "107.json", "107.png", "disponible");







