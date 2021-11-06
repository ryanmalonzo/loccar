<?php

function setLocation($idUtilisateur, $idVehicule, $etat) {
    require_once "./modele/connect.php";
    $pdo = PDO();

    $sql = 'UPDATE vehicule
            SET etatLocation = :etat, idUtilisateur = :idUtilisateur
            WHERE idVehicule = :idVehicule';

    try {
        $cmd = $pdo->prepare($sql);
        $cmd->bindParam(":etat", $etat);
        $cmd->bindParam(":idUtilisateur", $idUtilisateur);
        $cmd->bindParam(":idVehicule", $idVehicule);
        return $cmd->execute();

    } catch (PDOException $e) {
        echo utf8_encode("Echec de select : " . $e->getMessage() . "\n");
        die();
    }
}

function getIdModele($idVehicule) {
    require_once "./modele/connect.php";
    $pdo = PDO();

    $sql = "SELECT idModele FROM vehicule WHERE idVehicule = :idVehicule";

    try {
        $cmd = $pdo->prepare($sql);
        $cmd->bindParam(":idVehicule", $idVehicule);
        $exec = $cmd->execute();

        if ($exec) {
            return $cmd->fetchAll(PDO::FETCH_ASSOC)[0]["idModele"];
        }
        return NULL;

    } catch (PDOException $e) {
        echo utf8_encode("Echec de select : " . $e->getMessage() . "\n");
        die();
    }
}

function insererVehicule($idModele, $etatLocation = "disponible", $idUtilisateur = NULL) {
    require_once "./modele/connect.php";
    $pdo = PDO();

    $sql = "INSERT INTO vehicule VALUES (DEFAULT, :idModele, :etatLocation, :idUtilisateur)";

    try {
        $cmd = $pdo->prepare($sql);
        $cmd->bindParam(":idModele", $idModele);
        $cmd->bindParam(":etatLocation", $etatLocation);
        $cmd->bindParam(":idUtilisateur", $idUtilisateur);

        return $cmd->execute();

    } catch (PDOException $e) {
        echo utf8_encode("Echec de l'insertion : " . $e->getMessage() . "\n");
        die();
    }
}

function retirerVehiculeDisponible($idModele) {
    require_once "./modele/connect.php";
    $pdo = PDO();

    // Une suppression par appel
    $sql = 'DELETE FROM vehicule WHERE idModele = :idModele AND etatLocation = "disponible" AND idUtilisateur IS NULL LIMIT 1';

    try {
        $cmd = $pdo->prepare($sql);
        $cmd->bindParam(":idModele", $idModele);

        return $cmd->execute();

    } catch (PDOException $e) {
        echo utf8_encode("Echec de l'insertion : " . $e->getMessage() . "\n");
        die();
    }
}