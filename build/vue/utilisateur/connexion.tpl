<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, shrink-to-fit=no">
    <title>Loccar | Gestion et location de voitures</title>
    <meta property="og:type" content="website">
    <meta name="description" content="Loccar est un service de location de voitures pour professionnels. Réservez une flotte de véhicules et gérez vos locations de manière flexible.">
    <link rel="apple-touch-icon" type="image/png" sizes="180x180" href="assets/img/apple-touch-icon.png">
    <link rel="icon" type="image/png" sizes="16x16" href="assets/img/favicon-16x16.png">
    <link rel="icon" type="image/png" sizes="32x32" href="assets/img/favicon-32x32.png">
    <link rel="icon" type="image/png" sizes="180x180" href="assets/img/apple-touch-icon.png">
    <link rel="icon" type="image/png" sizes="192x192" href="assets/img/android-chrome-192x192.png">
    <link rel="icon" type="image/png" sizes="512x512" href="assets/img/android-chrome-512x512.png">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/ionicons/2.0.1/css/ionicons.min.css">
    <link rel="stylesheet" href="assets/css/Footer-Basic.css">
    <link rel="stylesheet" href="assets/css/Footer-Clean.css">
    <link rel="stylesheet" href="assets/css/Login-Form-Clean.css">
    <link rel="stylesheet" href="assets/css/Navigation-with-Button.css">
    <link rel="stylesheet" href="assets/css/Registration-Form-with-Photo.css">
    <link rel="stylesheet" href="assets/css/styles.css">
</head>

<body>
    <?php require_once "./vue/navbar.tpl" ?>
    <section class="login-clean">
        <form action="index.php?controle=utilisateur&action=connexion" method="post">
            <div class="illustration"><i class="icon ion-ios-navigate" style="color: #209cee;border-color: #209cee;"></i></div>
            <div class="mb-3"><input class="form-control" type="email" name="mail" placeholder="Adresse mail" required></div>
            <div class="mb-3"><input class="form-control" type="password" name="motdepasse" placeholder="Mot de passe" required></div>
            <div class="mb-3"><button class="btn btn-primary d-block w-100" type="submit" style="background: #209cee;">Connexion</button></div><a class="forgot" href="index.php?controle=utilisateur&action=inscription">Pas encore de compte ? Inscrivez-vous</a>
        </form>
    </section>
    <?php require_once "./vue/footer.tpl" ?>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/js/bootstrap.bundle.min.js"></script>
</body>

</html>