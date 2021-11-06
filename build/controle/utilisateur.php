<?php

function accueil() {
    require_once "./vue/utilisateur/accueil.tpl";
}

function connexion() {
    $mail = isset($_POST["mail"]) ? $_POST["mail"] : NULL;
    $motdepasse = isset($_POST["motdepasse"]) ? $_POST["motdepasse"] : NULL;

    if (isset($mail, $motdepasse)) {
        require_once "./modele/utilisateur_bd.php";

        if (getUtilisateur($mail, $motdepasse, $attributs)) {
            $_SESSION["utilisateur"] = $attributs[0];
            // Redirection TODO: tableau de bord
            header("Location: index.php");
        }

        else {
            $erreur = "Identifiants invalides";
            require "./vue/utilisateur/connexion.tpl";
        }
    }

    else {
        $erreur = NULL;
        require "./vue/utilisateur/connexion.tpl";
    }
}

function inscription() {
    $nom = isset($_POST["nom"]) ? $_POST["nom"] : NULL;
    $mail = isset($_POST["mail"]) ? $_POST["mail"] : NULL;
    $motdepasse = isset($_POST["motdepasse"]) ? $_POST["motdepasse"] : NULL;
    $societe = isset($_POST["societe"]) ? $_POST["societe"] : NULL;

    if (isset($nom, $mail, $motdepasse, $societe)) {
        if (champsValides($nom, $mail, $motdepasse, $societe)) {

            // Insérer nouveau client dans BDD
            require_once "./modele/utilisateur_bd.php";
            if (ajouterUtilisateur($nom, $mail, $motdepasse, $societe)) {

                // Créer la session PHP
                $_SESSION["utilisateur"] = array();
                
                // Récupérer l'utilisateur en BDD
                getUtilisateur($mail, $motdepasse, $_SESSION["utilisateur"]);
                
                // Redirection TODO: tableau de bord
                header("Location: index.php");
            }

            else {
                $erreur = "Échec de l'inscription, veuillez recommencer";
                require "./vue/utilisateur/inscription.tpl";
            }
        }
        else {
            $erreur = "Saisie invalide, veuillez recommencer";
            require "./vue/utilisateur/inscription.tpl";
        }
    }
    
    else {
        $erreur = NULL;
        require "./vue/utilisateur/inscription.tpl";
    }
}

function deconnexion() {
    session_unset();
    require_once "./vue/utilisateur/deconnexion.tpl";
    header("refresh:3, url=index.php");
}


// Vérification des formats des champs

function champsValides($nom, $mail, $motdepasse, $societe) {
    return nomValide($nom) && mailValide($mail) && motDePasseValide($motdepasse) && societeValide($societe);
}

function nomValide($nom) {
    return preg_match("`^[A-Z][a-zA-Z]{1,50}$`", $nom);
}

function mailValide($mail) {
    return filter_var($mail, FILTER_VALIDATE_EMAIL);
}

function motDePasseValide($motdepasse) {
    return preg_match("`(?=.*[0-9])(?=.*[A-Z])([a-zA-Z0-9]){8,16}`", $motdepasse);
}

function societeValide($societe) {
    return $societe !== 0; // 0 <=> "Société"
}
