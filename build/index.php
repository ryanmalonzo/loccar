<?php

session_start();

if (isset($_GET["controller"], $_GET["action"])) {
    $controle = $_GET["controller"];
    $action = $_GET["action"];
} else {
    $controle = "utilisateur";
    $action = "accueil";
}

require_once "./controller/$controle.php";
$action();
