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

function louer() {
    if (!isset($_SESSION["utilisateur"], $_GET["id"])) {
        header("Location: index.php?controle=utilisateur&action=connexion");
    }

    // Création des factures
    else if (isset($_POST["dateDebut"], $_POST["dateFin"], $_POST["quantite"])) {

        if (strtotime($_POST["dateFin"]) <= strtotime($_POST["dateDebut"])) {
            afficherPage("La date de fin doit être supérieure à la date de début");
            return;
        }

        // La quantité sélectionnée ne doit pas dépasser le nombre de voitures disponibles pour le modèle
        require_once "./modele/voiture_bd.php";
        if ($_POST["quantite"] > maxDisponibles($_GET["id"])) {
            afficherPage("La quantité sélectionnée est supérieure au nombre de voitures disponibles pour ce modèle");
            return;
        }

        $ids = getIdVehicules($_GET["id"]);
        // On récupère seulement les ID des X premiers véhicules
        $idVehiculesModele = array();
        for ($i = 0; $i < (int) $_POST["quantite"]; ++$i) {
            // array_push($idVehiculesModele, $ids[$i]["idVehicule"]);
            $idVehiculesModele[] = $ids[$i]["idVehicule"];
        }

        require_once "./modele/facture_bd.php";
        $idUtilisateur = $_SESSION["utilisateur"]["idUtilisateur"];

        foreach ($idVehiculesModele as $idVehicule) {
            // On actualise les états des véhicules concernés par la location
            setLocation($idUtilisateur, $idVehicule);

            // On crée les factures
            ajouterFacture($idUtilisateur, $idVehicule, $_POST["dateDebut"], $_POST["dateFin"]);
        }

        afficherPage("Location réalisée avec succès", true);
    }

    // Chargement initial
    else {
        afficherPage(NULL);
    }
}

function afficherPage($msg, $succes = false) {
    require_once "./modele/voiture_bd.php";
    getModele($_GET["id"], $modele);
    $max = maxDisponibles($_GET["id"]);

    if (!$succes) {
        $message = '<div class="alert alert-danger" role="alert">' . $msg. '</div>';
    }
    else {
        $message = '<div class="alert alert-success" role="alert">' . $msg. '</div>';
    }

    if ($msg === NULL) {
        $message = NULL;
    }

    require "./vue/voiture/louer.tpl";
}