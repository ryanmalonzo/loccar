<!doctype html>
<html lang="fr">

<head>
    <?php require_once "./view/header.tpl" ?>
    <style>
        nav {
            position: fixed !important;
            top: 0 !important;
            width: 100% !important;
        }
    </style>
</head>

<body onload="selectionnerModele()">
    <?php require_once "./view/navbar.tpl" ?>

    <section class="contact-clean d-flex flex-column justify-content-center align-items-center" style="width: 100vw;height: 100vh;">
        <form method="post" action="index.php?controle=admin&action=stock">
            <h2 class="text-center">Modifier les quantités disponibles d'un modèle</h2>
            <?php echo $message ?>
            <div class="container px-0">
                <div class="row">
                    <div class="col-md-9">
                        <div class="mb-3">
                            <select class="form-select" id="modele" name="idModele" onchange="chargerQuantite()" style="height: 42px;">
                                <option value="0" selected hidden>Modèle</option>
                                <?php
                                foreach ($modeles as $modele) {
                                    printf('<option value="%s">%s</option>', $modele["idModele"], $modele["nomModele"]);
                                }
                                ?>
                            </select>
                            <div class="form-text">Quantité actuellement disponible à la location</div>
                        </div>
                    </div>
                    <div class="col-md-3">
                        <?php
                        printf('<div class="mb-3"><input class="form-control" type="number" min="0"
                                                             style="text-align: center;" name="quantite" value="%d"></div>', $qt);
                        ?>
                    </div>
                </div>
            </div>
            <div class="mb-3">
                <button class="btn btn-primary" type="submit" style="width: 100%;">MODIFIER</button>
            </div>
        </form>
    </section>

    <?php include_once "./view/footer.tpl" ?>
</body>

</html>