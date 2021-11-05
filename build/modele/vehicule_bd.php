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
