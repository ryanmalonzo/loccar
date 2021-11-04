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
            $nb = 1;
            echo '<div class="row row-cols-3 justify-content-center articles">';
            foreach ($modeles as $modele) {
                echo '<div class="col-sm-6 col-md-4 item" style="width: 325px;">';

                $photo = $modele["photo"];
                printf('<img class="img-fluid" style="height: 200px; width: 300px;" src="./img/%s" alt="%s">', $photo, $photo);

                $nom = $modele["nomModele"];
                printf('<h3 class="name">%s</h3>', ucwords($nom));

                $cars = $modele["caracteristiques"];
                echo '<ul class="list-unstyled text-start description">';
                    foreach ($cars as $cle => $valeur) {
                    printf('<li>%s : %s</li>', $cle, $valeur);
                    }
                    echo '</ul>';

                echo '<a class="btn btn-primary btn-sm mt-3" type="button" role="button" href="#" style="width: 200px;">Louer</a>';

                echo '</div>';

                if ($nb === 3) { $nb = 0; echo '</div><div class="row row-cols-3 justify-content-center articles">'; }
                ++$nb;
            }
            ?>
        </div>
    </section>
</div>

<?php require_once "./vue/footer.tpl" ?>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/js/bootstrap.bundle.min.js"></script>
</body>

</html>