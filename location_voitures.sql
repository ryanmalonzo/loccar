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

INSERT INTO entreprise (adresseEntreprise, nomEntreprise) VALUES ("23 rue de la paix, Paris 75014","FNAC");
INSERT INTO client (nom, pseudo,motDePasse, idEntreprise) VALUES ("Dupont", "dupontPierre43", "GO/65st$", 1);
INSERT INTO vehicule (modele, caracteristiques, photo, etatLocation) VALUES ("Peugeot 107", "107.json", "107.png", "disponible");