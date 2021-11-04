<!DOCTYPE html>
<html lang="en">

<head>
    <?php require_once "./vue/header.tpl" ?>
</head>

<body>
    <?php require_once "./vue/navbar/default.tpl" ?>
    <section class="register-photo">
        <div class="form-container">
            <div class="image-holder"></div>
            <form action="index.php?controle=utilisateur&action=inscription" method="post">
                <h2 class="text-center"><strong>Créez </strong>votre compte</h2>
                <div class="mb-3"><p class="text-danger text-center"><?php echo $erreur ?></p></div>
                <div class="mb-3"><input class="form-control" type="text" placeholder="Nom" name="nom" required></div>
                <div class="mb-3"><input class="form-control" type="email" name="mail" placeholder="Adresse mail" required></div>
                <div class="mb-3"><input class="form-control" type="password" name="motdepasse" placeholder="Mot de passe" required></div>
                <div class="mb-3">
                    <select class="form-select" required name="societe">
                        <option value="0" selected hidden>Société</option>
                        <option value="1">Loccar</option>
                        <option value="2">FNAC</option>
                        <option value="3">Nestlé</option>
                        <option value="4">Crédit Agricole</option>
                        <option value="5">Auchan</option>
                    </select>
                </div>
                <div class="mb-3">
                    <div class="form-check"><label class="form-check-label"><input class="form-check-input" type="checkbox" required>J'accepte les&nbsp;<a href="#">conditions générales d'utilisation</a></label></div>
                </div>
                <div class="mb-3"><button class="btn btn-primary d-block w-100" type="submit" style="background: #209cee;">Inscription</button></div><a class="already" href="index.php?controle=utilisateur&action=connexion">Vous possédez déjà un compte ? Connectez-vous ici</a>
            </form>
        </div>
    </section>
    <?php require_once "./vue/footer.tpl" ?>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/js/bootstrap.bundle.min.js"></script>
</body>

</html>