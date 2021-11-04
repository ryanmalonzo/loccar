<?php

function get_modeles(&$modeles = array()) {
    require_once "./modele/connect.php";
    $pdo = PDO();

    $sql = "SELECT * FROM modele";

    try {
        $cmd = $pdo->prepare($sql);
        $exec = $cmd->execute();

        if ($exec) {
            $modeles = $cmd->fetchAll(PDO::FETCH_ASSOC);
            return count($modeles) !== 0;
        }
        return false;

    } catch (PDOException $e) {
        echo utf8_encode("Echec de select : " . $e->getMessage() . "\n");
        die();
    }

}
