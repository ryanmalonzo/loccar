<?php

function getModeles(&$modeles = array())
{
    require_once "./model/connect.php";
    $pdo = PDO();

    $sql = "SELECT * FROM modele";

    try {
        $cmd = $pdo->prepare($sql);
        $exec = $cmd->execute();

        if ($exec) {
            $modeles = $cmd->fetchAll(PDO::FETCH_ASSOC);
            return count($modeles) > 0;
        }
        return false;
    } catch (PDOException $e) {
        echo utf8_encode("Echec de select : " . $e->getMessage() . "\n");
        die();
    }
}

function getModele($idModele, &$modele = array())
{
    require_once "./model/connect.php";
    $pdo = PDO();

    $sql = "SELECT * FROM modele WHERE idModele = :idModele";

    try {
        $cmd = $pdo->prepare($sql);
        $cmd->bindParam(":idModele", $idModele);
        $exec = $cmd->execute();

        if ($exec) {
            $modele = $cmd->fetchAll(PDO::FETCH_ASSOC)[0];
            return count($modele) > 0;
        }
        return false;
    } catch (PDOException $e) {
        echo utf8_encode("Echec de select : " . $e->getMessage() . "\n");
        die();
    }
}

function maxDisponibles($idModele)
{
    require_once "./model/connect.php";
    $pdo = PDO();

    $sql = 'SELECT COUNT(idVehicule) AS max FROM vehicule WHERE idModele = :idModele AND etatLocation = "disponible"';

    try {
        $cmd = $pdo->prepare($sql);
        $cmd->bindParam(":idModele", $idModele);
        $exec = $cmd->execute();

        if ($exec) {
            return $cmd->fetchAll(PDO::FETCH_ASSOC)[0]["max"];
        }
        return NULL;
    } catch (PDOException $e) {
        echo utf8_encode("Echec de select : " . $e->getMessage() . "\n");
        die();
    }
}

function getIdVehicules($idModele)
{
    require_once "./model/connect.php";
    $pdo = PDO();

    $sql = 'SELECT idVehicule FROM vehicule WHERE idModele = :idModele AND etatLocation = "disponible"';

    try {
        $cmd = $pdo->prepare($sql);
        $cmd->bindParam(":idModele", $idModele);
        $exec = $cmd->execute();

        if ($exec) {
            return $cmd->fetchAll(PDO::FETCH_ASSOC);
        }
        return NULL;
    } catch (PDOException $e) {
        echo utf8_encode("Echec de select : " . $e->getMessage() . "\n");
        die();
    }
}

function getTarifJournalier($idModele)
{
    require_once "./model/connect.php";
    $pdo = PDO();

    $sql = "SELECT tarifJournalier FROM modele WHERE idModele = :idModele";

    try {
        $cmd = $pdo->prepare($sql);
        $cmd->bindParam(":idModele", $idModele);
        $exec = $cmd->execute();

        if ($exec) {
            return $cmd->fetchAll(PDO::FETCH_ASSOC)[0]["tarifJournalier"];
        }
        return NULL;
    } catch (PDOException $e) {
        echo utf8_encode("Echec de select : " . $e->getMessage() . "\n");
        die();
    }
}

function insererModele($nomModele, $caracteristiques, $photo, $tarifJournalier)
{
    require_once "./model/connect.php";
    $pdo = PDO();

    $sql = "INSERT INTO modele VALUES (DEFAULT, :nomModele, :caracteristiques, :photo, :tarifJournalier)";

    $tarifJournalier = (int) $tarifJournalier;

    try {
        $cmd = $pdo->prepare($sql);
        $cmd->bindParam(":nomModele", $nomModele);
        $cmd->bindParam(":caracteristiques", $caracteristiques);
        $cmd->bindParam(":photo", $photo);
        $cmd->bindParam(":tarifJournalier", $tarifJournalier);

        $exec = $cmd->execute();
        if ($exec) {
            return $pdo->lastInsertId();
        }
        return NULL;
    } catch (PDOException $e) {
        echo utf8_encode("Echec de l'insertion : " . $e->getMessage() . "\n");
        die();
    }
}
