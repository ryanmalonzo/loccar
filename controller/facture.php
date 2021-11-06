<?php

function liste()
{
    if (!isset($_SESSION["utilisateur"])) {
        header("Location: index.php?controle=utilisateur&action=connexion");
    }

    afficherPage();
}

function payer()
{
    if (!isset($_SESSION["utilisateur"], $_GET["id"])) {
        header("Location: index.php?controle=utilisateur&action=connexion");
    }

    require_once "./model/facture_bd.php";

    setEtatReglement($_SESSION["utilisateur"]["idUtilisateur"], $_GET["id"], true);
    require_once "./model/vehicule_bd.php";
    setLocation(NULL, $_GET["id"], "disponible");

    afficherPage("Paiement effectué avec succès");
}

function afficherPage($msg = NULL)
{
    require_once "./model/facture_bd.php";

    $factures = array();
    getFacturesUtilisateur($_SESSION["utilisateur"]["idUtilisateur"], $factures);

    require_once "./model/modele_bd.php";
    require_once "./model/vehicule_bd.php";

    foreach ($factures as &$facture) {
        // On récupère le nom et la photo du modèle associés à chaque facture
        getModele(getIdModele($facture["idVehicule"]), $modele);

        $facture["photo"] = $modele["photo"];
        $facture["nomModele"] = $modele["nomModele"];
    }
    unset($facture);

    $message = NULL;
    if ($msg !== NULL) {
        $message = '<div class="alert alert-success w-100" role="alert" style="margin-top: 16px">' . $msg . '</div>';
    }

    require "./view/facture/liste.tpl";
}