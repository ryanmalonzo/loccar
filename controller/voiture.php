<?php

function liste()
{
    require_once "./model/modele_bd.php";

    getModeles($modeles);

    // Parsing des caractéristiques JSON de chaque modèle de voiture
    foreach ($modeles as $index =>  $modele) {
        $path = "./assets/vehicule/json/" . $modele["caracteristiques"];
        $c_string = file_get_contents($path);

        $modeles[$index]["caracteristiques"] = json_decode($c_string, true);
    }

    require_once "./view/voiture/liste.tpl";
}

function louer()
{
    if (!isset($_SESSION["utilisateur"])) {
        header("Location: index.php?controller=utilisateur&action=connexion");
    }
    if (!isset($_GET["id"])) {
        header("Location: index.php?controller=voiture&action=liste");
    } // Création des factures
    else if (isset($_POST["dateDebut"], $_POST["dateFin"], $_POST["quantite"])) {

        // Date de fin vide => fin du mois
        if ($_POST["dateFin"] === "") {
            $_POST["dateFin"] = date("Y-m-t", strtotime($_POST["dateDebut"]));
        }

        if (strtotime($_POST["dateFin"]) < strtotime($_POST["dateDebut"])) {
            afficherPage("La date de fin doit être supérieure à la date de début");
            return;
        }

        // La quantité sélectionnée ne doit pas dépasser le nombre de voitures disponibles pour le modèle
        require_once "./model/modele_bd.php";
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

        require_once "./model/facture_bd.php";
        $idUtilisateur = $_SESSION["utilisateur"]["idUtilisateur"];

        require_once "./model/vehicule_bd.php";

        foreach ($idVehiculesModele as $idVehicule) {
            // On actualise l'état du véhicule concerné par la location
            setLocation($idUtilisateur, $idVehicule, "location");

            // Nombre de jours entre date de début et date de fin
            $jours = (int) date_diff(date_create($_POST["dateDebut"]), date_create($_POST["dateFin"]))->format("%a");

            if ($jours === 0) {
                $jours = 1;
            }
            $montant = $jours * (int) getTarifJournalier($_GET["id"]);
            ajouterFacture($idUtilisateur, $idVehicule, $_POST["dateDebut"], $_POST["dateFin"], $montant);
        }

        afficherPage("Location réalisée avec succès", true);
    } // Chargement initial
    else {
        afficherPage(NULL);
    }
}

function afficherPage($msg, $succes = false)
{
    require_once "./model/modele_bd.php";
    getModele($_GET["id"], $modele);
    $max = maxDisponibles($_GET["id"]);

    if ($succes) {
        $message = '<div class="alert alert-success" role="alert">' . $msg . '</div>';
    } else {
        $message = '<div class="alert alert-danger" role="alert">' . $msg . '</div>';
    }

    if ($msg === NULL) {
        $message = NULL;
    }

    require "./view/voiture/louer.tpl";
}