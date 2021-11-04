<?php

function get($mail, $motdepasse, &$attributs = array()) {
    require "./modele/connect.php";

    $sql = "SELECT * FROM utilisateur WHERE mail = :mail AND motDePasse = :motdepasse";

    $motdepasse = sha1($motdepasse);

    try {
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
    require "./modele/connect.php";

    $sql = "INSERT INTO utilisateur VALUES (DEFAULT, :nom, :mail, :motdepasse, :societe, :role)";

    $motdepasse = sha1($motdepasse);
    $societe = intval($societe);
    
    $role = ($societe == 1) ? "admin" : "client";

    try {
        $cmd = $pdo->prepare($sql);
        $cmd->bindParam(":nom", $nom);
        $cmd->bindParam(":mail", $mail);
        $cmd->bindParam(":motdepasse", $motdepasse);
        $cmd->bindParam(":societe", $societe);
        $cmd->bindParam(":role", $role);

        $bool = $cmd->execute();
        //print_r($cmd->errorInfo());
        return $bool;

    } catch (PDOException $e) {
        echo utf8_encode("Echec de l'insertion : " . $e->getMessage() . "\n");
        die();
    }
}