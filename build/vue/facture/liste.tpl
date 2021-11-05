<!doctype html>
<html lang="fr">

<head>
    <?php require_once "./vue/header.tpl" ?>
</head>

<body>
<?php require_once "./vue/navbar/default_session.tpl" ?>

<div class="container">
    <h1>Mon espace</h1>

    <?php echo $message ?>

    <div class="table-responsive border rounded" style="margin-top: 16px;">
        <table class="table table-striped" style="margin: 0">
            <thead>
            <tr>
                <th class="text-center">Photo</th>
                <th class="text-center">Modèle</th>
                <th class="text-center">Date de début</th>
                <th class="text-center">Date de fin</th>
                <th class="text-center">Montant</th>
                <th class="text-center">Paiement</th>
            </tr>
            </thead>
            <tr>

            <tbody>
            <?php
            foreach ($factures as $facture) {
                echo '<tr>';
                printf('<td class="d-xl-flex justify-content-xl-center"><img class="img-fluid" src="./img/%s" alt="%s" width="200px" height="100px"></td>', $facture["photo"], $facture["photo"]);
                printf('<td class="text-center align-middle"><p style="margin: 0;">%s</p></td>', $facture["nomModele"]);
                printf('<td class="text-center align-middle"><p style="margin: 0;">%s</p></td>', $facture["dateDebut"]);
                printf('<td class="text-center align-middle"><p style="margin: 0;">%s</p></td>', $facture["dateFin"]);
                printf('<td class="text-center align-middle"><p style="margin: 0;">%s €</p></td>', number_format($facture["montant"], 0, ',', ' '));
                printf('<td class="text-center align-middle"><a class="btn btn-dark" type="button" href="index.php?controle=facture&action=payer&id=%s">PAYER</a></td>' ,$facture["idVehicule"]);
                echo '</tr>';
            }
            ?>
            </tbody>
        </table>
    </div>
</div>

<?php require_once "./vue/footer.tpl" ?>

</body>
</html>