<?php

function getModeles(&$modeles = array()) {
    require_once "./modele/connect.php";
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

function getModele($idModele, &$modele = array()) {
    require_once "./modele/connect.php";
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

function maxDisponibles($idModele) {
    require_once "./modele/connect.php";
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

function getIdVehicules($idModele) {
    require_once "./modele/connect.php";
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

function setLocation($idUtilisateur, $idVehicule) {
    require_once "./modele/connect.php";
    $pdo = PDO();

    $sql = 'UPDATE vehicule
            SET etatLocation = "location", idUtilisateur = :idUtilisateur
            WHERE idVehicule = :idVehicule';

    try {
        $cmd = $pdo->prepare($sql);
        $cmd->bindParam(":idUtilisateur", $idUtilisateur);
        $cmd->bindParam(":idVehicule", $idVehicule);
        return $cmd->execute();

    } catch (PDOException $e) {
        echo utf8_encode("Echec de select : " . $e->getMessage() . "\n");
        die();
    }
}