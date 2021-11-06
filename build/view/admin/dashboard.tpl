<!doctype html>
<html lang="en">

<head>
    <?php require_once "./vue/header.tpl" ?>
    <style>
        nav {
            position: fixed !important;
            top: 0 !important;
            width: 100% !important;
        }
    </style>
</head>

<body style="background: white">

<?php require_once "./vue/navbar_light.tpl" ?>

<div class="d-flex flex-column justify-content-center align-items-center" style="height: 100vh;width: 100vw;">
    <div class="container pb-2">
        <?php
        printf('<h1 class="display-6 text-center d-xl-flex justify-content-xl-center align-items-xl-center" style="margin-bottom: 16px;">Bienvenue, M./Mme %s</h1>', $_SESSION["utilisateur"]["nom"]);
        ?>
    </div>
    <div>
        <ul class="list-group">
            <li class="list-group-item d-xl-flex justify-content-xl-center align-items-xl-center" style="text-align: center;"><a class="link-unstyled" href="index.php?controle=admin&action=locations">Consulter les locations par entreprise</a></li>
            <li class="list-group-item d-xl-flex justify-content-xl-center align-items-xl-center" style="text-align: center;"><a class="link-unstyled" href="index.php?controle=admin&action=modele">Ajouter un modèle de voiture</a></li>
            <li class="list-group-item d-xl-flex justify-content-xl-center align-items-xl-center" style="text-align: center;"><a class="link-unstyled" href="index.php?controle=admin&action=stock">Modifier les quantités d'un modèle</a></li>
        </ul>
    </div>
</div>

<script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/js/bootstrap.bundle.min.js"></script>

</body>

</html>