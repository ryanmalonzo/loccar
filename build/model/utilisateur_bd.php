<?php

function getUtilisateur($mail, $motdepasse, &$attributs = array()) {
    require_once "./model/connect.php";
    $pdo = PDO();

    $sql = "SELECT * FROM utilisateur WHERE mail = :mail AND motDePasse = :motdepasse";

    $motdepasse = sha1($motdepasse);

    try {
        $cmd = $pdo->prepare($sql);
        $cmd->bindParam(":mail", $mail);
        $cmd->bindParam(":motdepasse", $motdepasse);

        $exec = $cmd->execute();
        if ($exec) {
            $attributs = $cmd->fetchAll(PDO::FETCH_ASSOC);
            return count($attributs) > 0;
        }
        return false;
    } catch (PDOException $e) {
        echo utf8_encode("Echec de select : " . $e->getMessage() . "\n");
        die();
    }
}

function ajouterUtilisateur($nom, $mail, $motdepasse, $societe) {
    require_once "./model/connect.php";
    $pdo = PDO();

    $sql = "INSERT INTO utilisateur VALUES (DEFAULT, :nom, :mail, :motdepasse, :societe, :role)";

    $motdepasse = sha1($motdepasse);
    $societe = (int) $societe;

    $role = ($societe === 1) ? "admin" : "client";

    try {
        $cmd = $pdo->prepare($sql);
        $cmd->bindParam(":nom", $nom);
        $cmd->bindParam(":mail", $mail);
        $cmd->bindParam(":motdepasse", $motdepasse);
        $cmd->bindParam(":societe", $societe);
        $cmd->bindParam(":role", $role);

        return $cmd->execute();

    } catch (PDOException $e) {
        echo utf8_encode("Echec de l'insertion : " . $e->getMessage() . "\n");
        die();
    }
}