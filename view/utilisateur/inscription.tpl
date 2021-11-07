<!DOCTYPE html>
<html lang="en">

<head>
    <?php include_once "./view/header.tpl" ?>
</head>

<body>
    <?php include_once "./view/navbar.tpl" ?>
    <section class="register-photo">
        <div class="form-container">
            <div class="image-holder"></div>
            <form action="index.php?controle=utilisateur&action=inscription" method="post">
                <h2 class="text-center"><strong>Créez </strong>votre compte</h2>
                <?php
                if ($erreur !== NULL) {
                    printf('<div class="mb-3"><div class="alert alert-danger" role="alert">%s</div></div>', $erreur);
                }
                ?>
                <div class="mb-3"><input class="form-control" type="text" placeholder="Nom" name="nom" required></div>
                <div class="mb-3"><input class="form-control" type="email" name="mail" placeholder="Adresse mail" required>
                </div>
                <div class="mb-3"><input class="form-control" type="password" name="motdepasse" placeholder="Mot de passe" required>
                </div>
                <div class="mb-3">
                    <select class="form-select" required name="societe">
                        <option value="0" selected hidden>Société</option>
                        <?php
                        foreach ($entreprises as $entreprise) {
                            printf(
                                '<option value="%d">%s</option>',
                                $entreprise["idEntreprise"],
                                utf8_encode($entreprise["nomEntreprise"])
                            );
                        }
                        ?>
                    </select>
                </div>
                <div class="mb-3">
                    <div class="form-check"><label class="form-check-label"><input class="form-check-input" type="checkbox" required>J'accepte les&nbsp;<a href="#">conditions
                                générales d'utilisation</a></label></div>
                </div>
                <div class="mb-3">
                    <button class="btn btn-primary d-block w-100" type="submit" style="background: #209cee;">Inscription
                    </button>
                </div>
                <a class="already" href="index.php?controle=utilisateur&action=connexion">Vous possédez déjà un compte ?
                    Connectez-vous ici</a>
            </form>
        </div>
    </section>

    <?php include_once "./view/footer.tpl" ?>
</body>

</html>