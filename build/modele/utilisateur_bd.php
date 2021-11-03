<?php

function get($mail, $motdepasse, &$attributs = array()) {
    require_once "./modele/connect.php";
    $pdo = pdo();

    $sql = "SELECT * FROM utilisateur WHERE pseudo = :mail AND motDePasse = :motdepasse";

    try {
        $motdepasse = sha1($motdepasse);

        $cmd = $pdo->prepare($sql);
        $cmd->bindParam(":mail", $mail);
        $cmd->bindParam(":motdepasse", $motdepasse);

        $exec = $cmd->execute();
        if ($exec) {
            $attributs = $cmd->fetchAll(PDO::FETCH_ASSOC);
            if (count($attributs) == 0) {
                return false;
            }
            return true;

        } else {
            print_r($cmd->errorInfo());
            return false;
        }   
    } catch (PDOException $e) {
        echo utf8_encode("Echec de select : " . $e->getMessage() . "\n");
        die();
    }
}

function inserer($nom, $mail, $motdepasse, $societe) {
    require_once "./modele/connect.php";
    $pdo = pdo();

    if ($societe == "1") {
        $role = "admin";
    } else {
        $role = "client";
    }

    $sql = "INSERT INTO utilisateur (idUtilisateur, nom, pseudo, motDePasse, idEntreprise, role) VALUES (DEFAULT, :nom, :mail, :motdepasse, :societe, :roleU)";
    
    try {
        $motdepasse = sha1($motdepasse);
        $societe = intval($societe);

        $cmd = $pdo->prepare($sql);
        $cmd->bindParam(":nom", $nom);
        $cmd->bindParam(":mail", $mail);
        $cmd->bindParam(":motdepasse", $motdepasse);
        $cmd->bindParam(":societe", $societe);
        $cmd->bindParam(":roleU", $role);

        $bool = $cmd->execute();
        //print_r($cmd->errorInfo());
        return $bool;

    } catch (PDOException $e) {
        echo utf8_encode("Echec de l'insertion : " . $e->getMessage() . "\n");
        die();
    }
}