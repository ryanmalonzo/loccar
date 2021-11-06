<?php

const NB_CHAMPS = 7;
const MAX_PLACES = 8;

function dashboard() {
    require_once "./vue/admin/dashboard.tpl";
}

function modele() {
    if (!isset($_SESSION["utilisateur"])) {
        header("Location: index.php?controle=utilisateur&action=connexion");
    }
    if ($_SESSION["utilisateur"]["role"] !== "admin") {
        header("Location: index.php");
    }

    if (count($_POST) === NB_CHAMPS) {
        // Vérification de formats
        if (!valides($_POST["nbPlaces"], $_POST["tarifJournalier"], $_POST["quantite"])) {
            afficherPage("Saisie invalide, veuillez recommencer", "modele", false);
        }

        $nomFichier = str_replace(" ", "", ucwords($_POST["nomModele"]));

        $fichierImage = "";

        // Upload l'image
        if ($_FILES["photo"]["name"] !== "") {
            $info = pathinfo($_FILES["photo"]["name"]);
            $fichierImage = $nomFichier . "." . $info["extension"];

            if (!file_exists("img/" . $fichierImage)) {
                move_uploaded_file($_FILES["photo"]["tmp_name"], "img/" . $fichierImage);
            }
        }

        // Construire les caractéristiques JSON
        $data = array(
            "Moteur" => $_POST["moteur"],
            "Boîte de vitesse" => $_POST["boiteVitesse"],
            "Carburant" => $_POST["carburant"],
            "Nombre de places" => (int) $_POST["nbPlaces"]
        );
        $json = json_encode($data, JSON_PRETTY_PRINT | JSON_UNESCAPED_UNICODE);

        $fichierJSON = $nomFichier . ".json";
        file_put_contents("json/" . $fichierJSON, $json);

        // Insertion en BDD
        require_once "./modele/modele_bd.php";
        $idModele = insererModele($_POST["nomModele"], $fichierJSON, $fichierImage, $_POST["tarifJournalier"]);

        // Ajout des voitures selon quantité initiale
        require_once "./modele/vehicule_bd.php";
        for ($i = 0; $i < (int) $_POST["quantite"]; ++$i) {
            insererVehicule($idModele);
        }

        afficherPage("Nouveau modèle ajouté", true, "modele");
    }

    else {
        afficherPage(NULL, "modele");
    }
}

function stock() {
    if (!isset($_SESSION["utilisateur"])) {
        header("Location: index.php?controle=utilisateur&action=connexion");
    }
    if ($_SESSION["utilisateur"]["role"] !== "admin") {
        header("Location: index.php");
    }

    if (isset($_POST["idModele"], $_POST["quantite"])) {
        if ($_POST["idModele"] === "0") {
            afficherPage("Veuillez sélectionner un modèle", "stock", false);
        }

        require_once "./modele/modele_bd.php";
        $dispos = (int) maxDisponibles($_POST["idModele"]);

        $choix = (int) $_POST["quantite"];

        $nbChangements = abs($choix - $dispos);
        require_once "./modele/vehicule_bd.php";

        if ($choix === $dispos) {
            afficherPage("Veuillez saisir la nouvelle quantité en stock", "stock", false);
        }

        // Ajouter des véhicules
        else if ($choix > $dispos) {
            for ($i = 0; $i < $nbChangements; ++$i) {
                insererVehicule($_POST["idModele"]);
            }
            afficherPage($nbChangements . " ajouts effectués avec succès", "stock", true);
        }

        // Retirer des véhicules disponibles
        else {
            for ($i = 0; $i < $nbChangements; ++$i) {
                retirerVehiculeDisponible($_POST["idModele"]);
            }
            afficherPage($nbChangements. " retraits effectués avec succès", "stock", true);
        }
    }

    afficherPage(NULL, "stock");
}


function valides($nbPlaces, $tarifJournalier, $quantite) {
    return is_numeric($nbPlaces) && $nbPlaces > 0 && $nbPlaces <= MAX_PLACES && is_numeric($tarifJournalier) &&
        is_numeric($quantite) && $quantite >= 0;
}

function afficherPage($msg, $controle, $succes = false) {
    if ($succes) {
        $message = '<div class="alert alert-success" role="alert">' . $msg. '</div>';
    }
    else {
        $message = '<div class="alert alert-danger" role="alert">' . $msg. '</div>';
    }

    if ($msg === NULL) {
        $message = NULL;
    }

    // Traitements spécifiques au service stock
    if ($controle === "stock") {
        require_once "./modele/modele_bd.php";
        getModeles($modeles);

        $qt = 0;
        if (isset($_GET["id"]) && !isset($_POST["quantite"])) {
            require_once "./modele/modele_bd.php";
            $qt = maxDisponibles($_GET["id"]);
        }
    }

    require_once "./vue/admin/$controle.tpl";
}