<nav class="navbar navbar-light navbar-expand-md navigation-clean-button sticky-top" style="background-color: white">
    <div class="container">
        <a class="navbar-brand" href="index.php">Loccar</a>
        <button data-bs-toggle="collapse" class="navbar-toggler" data-bs-target="#navcol-1"><span
                    class="visually-hidden">Toggle navigation</span><span class="navbar-toggler-icon"></span></button>
        <div class="collapse navbar-collapse" id="navcol-1">
            <ul class="navbar-nav me-auto">
                <li class="nav-item"><a class="nav-link" href="index.php?controle=voiture&action=liste">Nos
                        véhicules</a></li>
                <?php
                if (isset($_SESSION["utilisateur"])) {
                    echo '<li class="nav-item"><a href="index.php?controle=facture&action=liste" class="nav-link">Mes
                    factures</a></li>';
                }
                if (isset($_SESSION["utilisateur"]) && $_SESSION["utilisateur"]["role"] === "admin") {
                    echo '<li class="nav-item"><a href="index.php?controle=admin&action=dashboard" class="nav-link">Dashboard
                        (admin)</a></li>';
                }
                ?>
            </ul>
            <?php
            if (isset($_SESSION["utilisateur"])) {
                echo '<span class="navbar-text actions"><a class="login"
                                                           href="index.php?controle=utilisateur&action=deconnexion">Déconnexion</a></span>';
            } else {
                echo '<span class="navbar-text actions"><a class="login"
                                                       href="index.php?controle=utilisateur&action=connexion">Connexion</a><a
                        class="btn btn-light action-button" role="button"
                        href="index.php?controle=utilisateur&action=inscription" style="background: #209cee;">Inscription</a></span>';
            }
            ?>
        </div>
    </div>
</nav>