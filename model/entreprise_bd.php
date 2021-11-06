<?php

function getEntreprises(&$entreprises)
{
    require_once "./model/connect.php";
    $pdo = PDO();

    $sql = "SELECT * FROM entreprise";

    try {
        $cmd = $pdo->prepare($sql);
        $exec = $cmd->execute();

        if ($exec) {
            $entreprises = $cmd->fetchAll(PDO::FETCH_ASSOC);
            return count($entreprises) > 0;
        }
        return false;

    } catch (PDOException $e) {
        echo utf8_encode("Echec de select : " . $e->getMessage() . "\n");
        die();
    }
}

function getEmployes($idEntreprise, &$employes)
{
    require_once "./model/connect.php";
    $pdo = PDO();

    $sql = "SELECT * FROM utilisateur WHERE idEntreprise = :idEntreprise";

    try {
        $cmd = $pdo->prepare($sql);
        $cmd->bindParam(":idEntreprise", $idEntreprise);

        $exec = $cmd->execute();

        if ($exec) {
            $employes = $cmd->fetchAll(PDO::FETCH_ASSOC);
            return count($employes) > 0;
        }
        return false;

    } catch (PDOException $e) {
        echo utf8_encode("Echec de select : " . $e->getMessage() . "\n");
        die();
    }
}