<!DOCTYPE html>
<html lang="fr">

<head>
    <?php require_once "./vue/header.tpl" ?>
</head>

<body>

<?php
    if (isset($_SESSION["utilisateur"]))
        require_once "./vue/navbar/default_session.tpl";
    else
        require_once "./vue/navbar/default.tpl";
?>

<div class="container">
    <h1>Nos véhicules</h1>
    <section class="article-list">
        <div class="container">
            <?php
            require_once "./modele/vehicule_bd.php";

            $nb = 1;
            echo '<div class="row row-cols-3 justify-content-center articles">';
            foreach ($modeles as $modele) {
                echo '<div class="col-sm-6 col-md-4 item" style="width: 325px">';

                $photo = $modele["photo"];
                printf('<img class="img-fluid" style="height: 200px; width: 300px;" src="./img/%s" alt="%s">', $photo, $photo);

                $nom = $modele["nomModele"];
                printf('<h3 class="name">%s</h3>', htmlspecialchars($nom));

                $cars = $modele["caracteristiques"];
                echo '<ul class="list-unstyled text-start description">';
                    foreach ($cars as $cle => $valeur) {
                    printf('<li>%s : %s</li>', $cle, htmlspecialchars($valeur));
                    }
                    echo '</ul>';

                printf('<p class="text-dark fw-bolder text-center description">Tarif journalier : %s €</p>', $modele["tarifJournalier"]);

                $max = maxDisponibles($modele["idModele"]);

                if ($max > 0) {
                    printf('<a class="btn btn-primary btn-sm mt-3 fw-bold" type="button" role="button" href="index.php?controle=voiture&action=louer&id=%s" style="width: 200px;">LOUER</a>', $modele["idModele"]);
                } else {
                    printf('<button class="btn btn-secondary btn-sm mt-3 fw-bold" type="button" role="button" style="width: 200px;" disabled>RUPTURE</button>');
                }

                echo '</div>';

                if ($nb === 3) { $nb = 0; echo '</div><div class="row row-cols-3 justify-content-center articles">'; }
                ++$nb;
            }
            echo '</div>';
            ?>
        </div>
    </section>
</div>

<?php require_once "./vue/footer.tpl" ?>

</body>

</html>