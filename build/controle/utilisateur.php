<?php

function accueil() {
    require_once "./vue/utilisateur/accueil.tpl";
}

function connexion() {
    $mail = isset($_POST["mail"]) ? $_POST["mail"] : NULL;
    $motdepasse = isset($_POST["motdepasse"]) ? $_POST["motdepasse"] : NULL;

    if (isset($mail) && isset($motdepasse)) {
        require_once "./modele/utilisateur_bd.php";
        if (get($mail, $motdepasse, $attributs)) {
            $_SESSION["utilisateur"] = $attributs[0];
            echo "Connexion OK";
            // Rediriger vers ...
        }

        else {
            echo "Connexion pas OK";
            // Formulaire + message d'erreur
        }
    }

    else {
        require_once "./vue/utilisateur/connexion.tpl";
    }
}

function inscription() {
    $nom = isset($_POST["nom"]) ? $_POST["nom"] : NULL;
    $mail = isset($_POST["mail"]) ? $_POST["mail"] : NULL;
    $motdepasse = isset($_POST["motdepasse"]) ? $_POST["motdepasse"] : NULL;
    $societe = isset($_POST["societe"]) ? $_POST["societe"] : NULL;

    if (isset($nom) && isset($mail) && isset($motdepasse) && isset($societe)) {        
        if (champsValides($nom, $mail, $motdepasse, $societe)) {
            // Insérer nouveau client dans BDD
            require_once "./modele/utilisateur_bd.php";
            if (inserer($nom, $mail, $motdepasse, $societe)) {
                // 2 - Créer la session PHP
                $_SESSION["utilisateur"] = array();
                // Récupérer l'utilisateur en BDD
                
                
                
                
                // 3 - Rediriger vers ... ?
            }

            else {
                // Rediriger vers le formulaire d'inscription
                // en affichant un message d'erreur
                echo "Insertion PAS OK :(";
            }
        }
        else {
            echo "Une saisie ou plus sont invalides !";
        }
    }
    
    else {
        require_once "./vue/utilisateur/inscription.tpl";
    }
}

function deconnexion() {
    if (session_unset()) {
        echo "Déconnexion réussie. Redirection dans 3...";
        header("refresh:3, url=index.php");
    }
    else header("Location: index.php");
}




// Vérifications de formats

function champsValides($nom, $mail, $motdepasse, $societe) {
    return nomValide($nom) && mailValide($mail) && motDePasseValide($motdepasse) && societeValide($societe);
}

function nomValide($nom) {
    return preg_match("`^[A-Z][a-zA-Z]{1,}$`", $nom);
}

function mailValide($mail) {
    return filter_var($mail, FILTER_VALIDATE_EMAIL);
}

function motDePasseValide($motdepasse) {
    return preg_match("`(?=.*[0-9])(?=.*[A-Z])([a-zA-Z0-9]){8,16}`", $motdepasse);
}

function societeValide($societe) {
    if ($societe == "0") // "Société"
        return false;

    // Vérifier si le numéro société correspond à une société dans la BDD ?
    return true;
}

