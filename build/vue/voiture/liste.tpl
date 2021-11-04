<!doctype html>
<html lang="fr">

<head>
    <?php require_once "./vue/header.tpl" ?>
</head>

<body>
    <?php
        foreach ($modeles as $modele) {
            echo "<ul>";
            foreach ($modele as $cle => $valeur) {
                if ($cle == "caracteristiques") {
                    echo "<li>Caractéristiques : <ul>";
                    foreach ($valeur as $nomCarac => $valeurCarac) {
                        printf("<li>%s : %s</li>", $nomCarac, $valeurCarac);
                    }
                    echo "</ul></li>";
                }

                else if ($cle == "photo") {
                    printf('<li>Photo :<br><img class="img-fluid" style="height: 200px; width:350px;" src="./img/%s" alt="%s"></li>', $valeur, $valeur);
                }

                else {
                    printf("<li>%s : %s</li>", $cle, $valeur);
                }
            }
            echo "</ul><hr>";
        }
    ?>
</body>
</html>