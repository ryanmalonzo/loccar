<?php

const NB_CHAMPS = 7; // La photo ne va pas dans $_POST
const MAX_PLACES = 7;

function dashboard()
{
    require_once "./view/admin/dashboard.tpl";
}

function modele()
{
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

            if (!file_exists("assets/vehicule/img/" . $fichierImage)) {
                move_uploaded_file($_FILES["photo"]["tmp_name"], "assets/vehicule/img/" . $fichierImage);
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
        file_put_contents("assets/vehicule/json/" . $fichierJSON, $json);

        // Insertion en BDD
        require_once "./model/modele_bd.php";
        $idModele = insererModele($_POST["nomModele"], $fichierJSON, $fichierImage, $_POST["tarifJournalier"]);

        // Ajout des voitures selon quantité initiale
        require_once "./model/vehicule_bd.php";
        for ($i = 0; $i < (int) $_POST["quantite"]; ++$i) {
            insererVehicule($idModele);
        }

        afficherPage("Nouveau modèle ajouté", "modele", true);
    } else {
        afficherPage(NULL, "modele");
    }
}

function stock()
{
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

        require_once "./model/modele_bd.php";
        $dispos = (int) maxDisponibles($_POST["idModele"]);

        $choix = (int) $_POST["quantite"];

        $nbChangements = abs($choix - $dispos);
        require_once "./model/vehicule_bd.php";

        if ($choix === $dispos) {
            afficherPage("Veuillez saisir la nouvelle quantité en stock", "stock", false);
        } // Ajouter des véhicules
        else if ($choix > $dispos) {
            for ($i = 0; $i < $nbChangements; ++$i) {
                insererVehicule($_POST["idModele"]);
            }
            afficherPage($nbChangements . " ajouts effectués avec succès", "stock", true);
        } // Retirer des véhicules disponibles
        else {
            for ($i = 0; $i < $nbChangements; ++$i) {
                retirerVehiculeDisponible($_POST["idModele"]);
            }
            afficherPage($nbChangements . " retraits effectués avec succès", "stock", true);
        }
    }

    afficherPage(NULL, "stock");
}


function valides($nbPlaces, $tarifJournalier, $quantite)
{
    return is_numeric($nbPlaces) && $nbPlaces > 0 && $nbPlaces <= MAX_PLACES && is_numeric($tarifJournalier) &&
        is_numeric($quantite) && $quantite >= 0;
}

function afficherPage($msg, $controle, $succes = false)
{
    if ($succes) {
        $message = '<div class="alert alert-success" role="alert">' . $msg . '</div>';
    } else {
        $message = '<div class="alert alert-danger" role="alert">' . $msg . '</div>';
    }

    if ($msg === NULL) {
        $message = NULL;
    }

    // Traitements spécifiques au service stock
    if ($controle === "stock") {
        require_once "./model/modele_bd.php";
        getModeles($modeles);

        $qt = 0;
        if (isset($_GET["id"]) && !isset($_POST["quantite"])) {
            require_once "./model/modele_bd.php";
            $qt = maxDisponibles($_GET["id"]);
        }
    }

    require_once "./view/admin/$controle.tpl";
}

function locations()
{
    require_once "./model/entreprise_bd.php";

    getEntreprises($entreprises);

    // On récupère les employés de chaque entreprise
    foreach ($entreprises as &$entreprise) {
        $entreprise["employes"] = array();
        getEmployes($entreprise["idEntreprise"], $entreprise["employes"]);
    }
    unset($entreprise);

    // On récupère les factures de tous les employés de chaque entreprise
    require_once "./model/facture_bd.php";
    require_once "./model/modele_bd.php";
    require_once "./model/vehicule_bd.php";

    foreach ($entreprises as &$entreprise) {
        $entreprise["cumul"] = 0;
        foreach ($entreprise["employes"] as &$employe) {
            $employe["factures"] = array();
            getFacturesUtilisateur($employe["idUtilisateur"], $employe["factures"]);

            foreach ($employe["factures"] as &$facture) {
                // On récupère le nom et la photo du modèle associés à chaque facture
                getModele(getIdModele($facture["idVehicule"]), $modele);

                $facture["photo"] = $modele["photo"];
                $facture["nomModele"] = $modele["nomModele"];

                $entreprise["cumul"] += (int) $facture["montant"];
            }
            unset($facture);
        }
        unset($employe);
    }
    unset($entreprise);

    require_once "./view/admin/locations.tpl";
}