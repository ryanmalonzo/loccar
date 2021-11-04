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
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,700">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/ionicons/2.0.1/css/ionicons.min.css">
    <link rel="stylesheet" href="assets/css/Contact-Form-Clean.css">
    <link rel="stylesheet" href="assets/css/Features-Boxed.css">
    <link rel="stylesheet" href="assets/css/Footer-Basic.css">
    <link rel="stylesheet" href="assets/css/Header-Blue.css">
    <link rel="stylesheet" href="assets/css/Navigation-with-Button.css">
    <link rel="stylesheet" href="assets/css/styles.css">
</head>

<body>
    <header class="header-blue" style="padding-bottom: 120px;margin-bottom: 0px;">
        <?php
            if (isset($_SESSION["utilisateur"]))
                require_once "./vue/navbar/accueil_session.tpl";
            else
                require_once "./vue/navbar/accueil.tpl";
        ?>
        <div class="container hero">
            <div class="row">
                <div class="col-12 col-lg-6 col-xl-5 offset-xl-1 align-self-center">
                    <h1 style="margin-top: 24px;">Loccar</h1>
                    <p>Louer une voiture n'a jamais été aussi simple.</p><button class="btn btn-light btn-lg action-button" type="button">Réserver une voiture</button>
                </div>
                <div class="col-md-5 col-lg-5 offset-lg-1 offset-xl-0 d-none d-lg-none d-xl-flex align-items-xl-center phone-holder"><img class="img-fluid d-xl-flex align-items-xl-center" src="assets/img/sunset-car-vehicle-road-evening-morning-Audi-side-view-dusk-r8-v10-automobile-make-559259.png" style="box-shadow: 0px 0px 10px;">
                </div>
            </div>
        </div>
    </header>
    <section class="features-boxed">
        <div class="container">
            <div class="intro">
                <h2 class="text-center">Coups de cœur de nos clients<br></h2>
                <p class="text-center">Nos clients vous recommandent les voitures suivantes :</p>
            </div>
            <div class="row justify-content-center features">
                <div class="col-sm-auto col-md-6 col-lg-auto col-xl-auto item">
                    <div class="box"><img class="img-fluid" src="assets/img/AA8.jpg" style="height: 200px;">
                        <h3 class="name" style="padding-top: 20px;">Audi A8</h3>
                        <ul>
                            <li class="text-start">Moteur 18CV</li>
                            <li class="text-start">Automatique</li>
                            <li class="text-start">Hybride</li>
                            <li class="text-start">5 places</li>
                        </ul><a class="learn-more" href="#">Réserver le véhicule</a>
                    </div>
                </div>
                <div class="col-sm-auto col-md-6 col-lg-4 item">
                    <div class="box"><img class="img-fluid" src="assets/img/Fabia.jpg" style="height: 200px;">
                        <h3 class="name" style="padding-top: 20px;">Skoda Fabia</h3>
                        <ul>
                            <li class="text-start">Moteur 5CV</li>
                            <li class="text-start">Mécanique</li>
                            <li class="text-start">Essence</li>
                            <li class="text-start">5 places</li>
                        </ul><a class="learn-more" href="#">Réserver le véhicule</a>
                    </div>
                </div>
                <div class="col-sm-auto col-md-6 col-lg-4 item">
                    <div class="box"><img class="img-fluid" src="assets/img/ClioIV.jpg" style="height: 200px;">
                        <h3 class="name" style="padding-top: 20px;">Renault Clio IV</h3>
                        <ul>
                            <li class="text-start">Moteur 4CV</li>
                            <li class="text-start">Automatique</li>
                            <li class="text-start">Bi-carburant</li>
                            <li class="text-start">5 places</li>
                        </ul><a class="learn-more" href="#">Réserver le véhicule</a>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <section class="contact-clean" id="contact">
        <form method="post">
            <h2 class="text-center">Nous contacter</h2>
            <div style="margin-bottom: 16px;"><input class="form-control" type="text" placeholder="Nom"></div>
            <div style="margin-bottom: 16px;"><input class="form-control" type="email" placeholder="Adresse mail"></div>
            <div style="margin-bottom: 16px;"><input class="form-control" type="text" placeholder="Société"></div>
            <div class="mb-3"><textarea class="form-control" name="message" placeholder="Message" rows="14"></textarea></div>
            <div class="mb-3 d-xl-flex justify-content-xl-center"><button class="btn btn-primary" type="submit">ENVOYER</button></div>
        </form>
    </section>
    <?php require_once "./vue/footer.tpl" ?>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/js/bootstrap.bundle.min.js"></script>
</body>

</html>