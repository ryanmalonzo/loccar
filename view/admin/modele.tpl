<!doctype html>
<html lang="fr">

<head>
    <?php include_once "./view/header.tpl" ?>

    <style>
        nav {
            position: fixed !important;
            top: 0 !important;
            width: 100% !important;
        }

        .form-control {
            height: 38px !important;
        }
    </style>
</head>

<body>

    <?php include_once "./view/navbar.tpl" ?>

    <section class="contact-clean d-flex flex-column justify-content-center align-items-center" style="height: 100vh;width: 100vw;">
        <form method="post" action="index.php?controle=admin&action=modele" enctype="multipart/form-data">
            <h2 class="text-center">Ajouter un modèle de voiture</h2>
            <?php echo $message ?>
            <div class="mb-2"><label class="form-label" for="nomModele">Nom du modèle</label><input class="form-control" type="text" required name="nomModele" placeholder="Nissan Qashqai">
            </div>
            <div class="mb-2"><label class="form-label" for="photo">Photo d'illustration</label><input class="form-control" type="file" required accept="image/*" name="photo"></div>
            <div class="container" style="padding: 0;">
                <div class="row">
                    <div class="col-md-6">
                        <div class="mb-2"><label class="form-label" for="moteur">Moteur</label><input class="form-control" type="text" placeholder="7 CV" name="moteur"></div>
                    </div>
                    <div class="col-md-6">
                        <div class="mb-2"><label class="form-label" for="boiteVitesse">Boîte de vitesse</label><input class="form-control" type="text" placeholder="Mécanique" name="boiteVitesse"></div>
                    </div>
                </div>
            </div>
            <div class="container" style="padding: 0;">
                <div class="row">
                    <div class="col-md-6">
                        <div class="mb-2"><label class="form-label" for="carburant">Carburant</label><input class="form-control" type="text" placeholder="Essence" name="carburant"></div>
                    </div>
                    <div class="col-md-6">
                        <div class="mb-2"><label class="form-label" for="nbPlaces">Nombre de places</label><input class="form-control" type="number" name="nbPlaces" min="1" max="8" placeholder="5">
                        </div>
                    </div>
                </div>
            </div>
            <div class="container" style="padding: 0;">
                <div class="row">
                    <div class="col-md-6">
                        <div class="mb-2"><label class="form-label" for="tarifJournalier">Tarif journalier (€)</label><input class="form-control" type="text" placeholder="150" name="tarifJournalier"></div>
                    </div>
                    <div class="col-md-6">
                        <div class="mb-2"><label class="form-label" for="quantite">Quantité initiale</label><input class="form-control" type="number" name="quantite" min="0" placeholder="3"></div>
                    </div>
                </div>
            </div>
            <div class="mb-2">
                <button class="btn btn-primary" type="submit" style="width: 100%;">AJOUTER</button>
            </div>
        </form>
    </section>

    <?php include_once "./view/footer.tpl" ?>

</body>

</html>