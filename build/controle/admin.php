<?php

const NB_CHAMPS = 7;

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
        $imageFile = ""; $filename = "";

        // Upload l'image
        if ($_FILES["photo"]["name"] !== "") {
            $info = pathinfo($_FILES["photo"]["name"]);

            $filename = $info["filename"];
            $imageFile = $filename . "." . $info["extension"];

            if (!file_exists("img/" . $imageFile)) {
                move_uploaded_file($_FILES["photo"]["tmp_name"], "img/" . $imageFile);
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

        $jsonFile = $filename . ".json";
        file_put_contents("json/" . $jsonFile, $json);

        // Insertion en BDD
        require_once "./modele/modele_bd.php";
        $idModele = insererModele($_POST["nomModele"], $jsonFile, $imageFile, $_POST["tarifJournalier"]);

        // Ajout des voitures selon quantité initiale
        require_once "./modele/vehicule_bd.php";
        for ($i = 0; $i < (int) $_POST["quantite"]; ++$i) {
            insererVehicule($idModele);
        }

        // TODO MESSAGE DE SUCCES
        header("Location: index.php?controle=admin&action=modele");
    }

    else {
        require_once "./vue/admin/modele.tpl";
    }
}

function stock() {

}