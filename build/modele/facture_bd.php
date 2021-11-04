<?php

function ajouterFacture($idUtilisateur, $idVehicule, $dateDebut, $dateFin) {
    require_once "./modele/connect.php";
    $pdo = PDO();

    $sql = "INSERT INTO facture VALUES (:idUtilisateur, :idVehicule, :dateDebut, :dateFin, false)";

    if ($dateFin === "") {
        $dateFin = NULL;
    }

    try {
        $cmd = $pdo->prepare($sql);
        $cmd->bindParam(":idUtilisateur", $idUtilisateur);
        $cmd->bindParam(":idVehicule", $idVehicule);
        $cmd->bindParam(":dateDebut", $dateDebut);
        $cmd->bindParam(":dateFin", $dateFin);

        return $cmd->execute();

    } catch (PDOException $e) {
        echo utf8_encode("Echec de l'insertion : " . $e->getMessage() . "\n");
        die();
    }
}