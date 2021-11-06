<?php

function ajouterFacture($idUtilisateur, $idVehicule, $dateDebut, $dateFin, $montant)
{
    require_once "./model/connect.php";
    $pdo = PDO();

    $sql = "INSERT INTO facture VALUES (DEFAULT, :idUtilisateur, :idVehicule, :dateDebut, :dateFin, :montant, false)";

    try {
        $cmd = $pdo->prepare($sql);
        $cmd->bindParam(":idUtilisateur", $idUtilisateur);
        $cmd->bindParam(":idVehicule", $idVehicule);
        $cmd->bindParam(":dateDebut", $dateDebut);
        $cmd->bindParam(":dateFin", $dateFin);
        $cmd->bindParam(":montant", $montant);

        return $cmd->execute();

    } catch (PDOException $e) {
        echo utf8_encode("Echec de l'insertion : " . $e->getMessage() . "\n");
        die();
    }
}

function getFacturesUtilisateur($idUtilisateur, &$factures = array())
{
    require_once "./model/connect.php";
    $pdo = PDO();

    $sql = 'SELECT * FROM facture WHERE idUtilisateur = :idUtilisateur AND etatReglement = 0';

    try {
        $cmd = $pdo->prepare($sql);
        $cmd->bindParam(":idUtilisateur", $idUtilisateur);

        $exec = $cmd->execute();
        if ($exec) {
            $factures = $cmd->fetchAll(PDO::FETCH_ASSOC);
            return count($factures) > 0;
        }
        return false;

    } catch (PDOException $e) {
        echo utf8_encode("Echec de select : " . $e->getMessage() . "\n");
        die();
    }
}

function setEtatReglement($idUtilisateur, $idVehicule, $etatReglement)
{
    require_once "./model/connect.php";
    $pdo = PDO();

    $sql = "UPDATE facture 
            SET etatReglement = :etatReglement 
            WHERE idUtilisateur = :idUtilisateur 
            AND idVehicule = :idVehicule 
            AND etatReglement = 0";

    try {
        $cmd = $pdo->prepare($sql);
        $cmd->bindParam(":etatReglement", $etatReglement);
        $cmd->bindParam(":idUtilisateur", $idUtilisateur);
        $cmd->bindParam(":idVehicule", $idVehicule);

        return $cmd->execute();

    } catch (PDOException $e) {
        echo utf8_encode("Echec d'update : " . $e->getMessage() . "\n");
        die();
    }
}