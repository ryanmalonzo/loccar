<?php

function pdo() {
    $hostname = "localhost";
    $dbname = "location_voitures";
    $user = "root";
    $pass = "";

    try {
        $pdo = new PDO("mysql:server=$hostname; dbname=$dbname", $user, $pass);
    } catch (PDOException $e) {
        die("Echec de connexion : " . utf8_encode($e->getMessage()) . "\n");
    }

    return $pdo;
}