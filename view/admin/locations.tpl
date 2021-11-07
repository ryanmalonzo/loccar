<!doctype html>
<html lang="fr">

<head>
    <?php include_once "./view/header.tpl" ?>
</head>

<body>
    <?php include_once "./view/navbar.tpl" ?>

    <div class="container">
        <h1>Locations</h1>

        <?php
        foreach ($entreprises as $entreprise) {
            printf('<h3 class="mt-5">%s</h3>', utf8_encode($entreprise["nomEntreprise"]));
            echo '<div class="table-responsive border rounded" style="margin-top: 16px;">';
            echo '<table class="table table-striped" style="margin: 0">';
            echo '
            <thead>
            <tr>';
            echo '
                <th class="text-center">Employé</th>
                ';
            echo '
                <th class="text-center">Photo</th>
                ';
            echo '
                <th class="text-center">Modèle</th>
                ';
            echo '
                <th class="text-center">Date de début</th>
                ';
            echo '
                <th class="text-center">Date de fin</th>
                ';
            echo '
                <th class="text-center">Montant</th>
                ';
            echo '
            </tr>
            </thead>
            ';

            echo '
            <tbody>';

            foreach ($entreprise["employes"] as $employe) {
                foreach ($employe["factures"] as $facture) {
                    echo '
            <tr>';
                    printf('
                <td class="text-center align-middle"><p style="margin: 0;">%s</p></td>
                ', htmlspecialchars($employe["nom"]));
                    printf('
                <td class="d-xl-flex justify-content-xl-center"><img class="img-fluid" src="./assets/vehicule/img/%s"
                                                                     alt="%s" width="200px" height="100px"></td>
                ', $facture["photo"], $facture["photo"]);
                    printf('
                <td class="text-center align-middle"><p style="margin: 0;">%s</p></td>
                ', htmlspecialchars($facture["nomModele"]));
                    printf('
                <td class="text-center align-middle"><p style="margin: 0;">%s</p></td>
                ', $facture["dateDebut"]);
                    printf('
                <td class="text-center align-middle"><p style="margin: 0;">%s</p></td>
                ', $facture["dateFin"]);
                    printf('
                <td class="text-center align-middle"><p style="margin: 0;">%s €</p></td>
                ', number_format($facture["montant"], 0, ',', ' '));
                    echo '
            </tr>
            ';
                }
            }
            echo '
            </tbody>
        </table>
    </div>
    ';

            printf('<h6 class="mt-3 mb-5 text-end">Montant cumulé : %s €</h6>', number_format($entreprise["cumul"], 0, ',', ''));
        }
        ?>

    </div>

    <?php include_once "./view/footer.tpl" ?>

</body>

</html>