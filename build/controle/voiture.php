<?php

function liste() {
    require_once "./modele/voiture_bd.php";

    getModeles($modeles);

    // Parsing des caractéristiques JSON de chaque modèle de voiture
    foreach ($modeles as $index => $modele) {
        $path = "./json/" . $modele["caracteristiques"];
        $c_string = file_get_contents($path);

        $modeles[$index]["caracteristiques"] = json_decode($c_string, true);
    }

    require_once "./vue/voiture/liste.tpl";
}