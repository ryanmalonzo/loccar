<!DOCTYPE html>
<html lang="en">

<head>
    <?php include_once "./view/header.tpl" ?>
    <style>
        nav {
            background-color: transparent !important;
            position: relative !important;
        }

        .navbar-brand,
        .nav-link,
        a.login {
            color: white !important;
        }
    </style>
</head>

<body>
    <header class="header-blue" style="padding-bottom: 120px; margin-bottom: 0;">
        <?php include_once "./view/navbar.tpl" ?>
        <div class="container hero">
            <div class="row">
                <div class="col-12 col-lg-6 col-xl-5 offset-xl-1 align-self-center">
                    <h1 style="margin-top: 24px;">Loccar</h1>
                    <p>Louer une voiture n'a jamais été aussi simple.</p><a class="btn btn-light btn-lg action-button" type="button" role="button" href="index.php?controle=voiture&action=liste">Réserver
                        une voiture</a>
                </div>
                <div class="col-md-5 col-lg-5 offset-lg-1 offset-xl-0 d-none d-lg-none d-xl-flex align-items-xl-center phone-holder">
                    <img class="img-fluid d-xl-flex align-items-xl-center" src="assets/img/sunset-car.png" style="box-shadow: 0px 0px 10px;">
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
                    <div class="box"><img class="img-fluid" src="assets/img/AA8.jpg" alt="Audi A8" style="height: 200px;">
                        <h3 class="name" style="padding-top: 20px;">Audi A8</h3>
                        <ul>
                            <li class="text-start">Moteur 18 CV</li>
                            <li class="text-start">Automatique</li>
                            <li class="text-start">Hybride</li>
                            <li class="text-start">5 places</li>
                        </ul>
                        <a class="learn-more" href="index.php?controle=voiture&action=louer&id=6">Réserver le véhicule</a>
                    </div>
                </div>
                <div class="col-sm-auto col-md-6 col-lg-4 item">
                    <div class="box"><img class="img-fluid" src="assets/img/Fabia.jpg" alt="Skoda Fabia" style="height: 200px;">
                        <h3 class="name" style="padding-top: 20px;">Skoda Fabia</h3>
                        <ul>
                            <li class="text-start">Moteur 5 CV</li>
                            <li class="text-start">Mécanique</li>
                            <li class="text-start">Essence</li>
                            <li class="text-start">5 places</li>
                        </ul>
                        <a class="learn-more" href="index.php?controle=voiture&action=louer&id=10">Réserver le véhicule</a>
                    </div>
                </div>
                <div class="col-sm-auto col-md-6 col-lg-4 item">
                    <div class="box"><img class="img-fluid" src="assets/img/ClioIV.jpg" alt="Renault Clio IV" style="height: 200px;">
                        <h3 class="name" style="padding-top: 20px;">Renault Clio IV</h3>
                        <ul class="text-start">
                            <li>Moteur 4 CV</li>
                            <li>Automatique</li>
                            <li>Bi-carburant</li>
                            <li>5 places</li>
                        </ul>
                        <a class="learn-more" href="index.php?controle=voiture&action=louer&id=3">Réserver le véhicule</a>
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
            <div class="mb-3"><textarea class="form-control" name="message" placeholder="Message" rows="14"></textarea>
            </div>
            <div class="mb-3 d-xl-flex justify-content-xl-center">
                <button class="btn btn-primary" type="submit">ENVOYER</button>
            </div>
        </form>
    </section>

    <?php include_once "./view/footer.tpl" ?>
</body>

</html>