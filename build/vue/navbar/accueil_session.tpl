<nav class="navbar navbar-light navbar-expand-md navigation-clean-button">
    <div class="container"><a class="navbar-brand" href="index.php">Loccar</a><button data-bs-toggle="collapse" class="navbar-toggler" data-bs-target="#navcol-1"><span class="visually-hidden">Toggle navigation</span><span class="navbar-toggler-icon"></span></button>
        <div class="collapse navbar-collapse" id="navcol-1">
            <ul class="navbar-nav me-auto">
                <li class="nav-item"><a class="nav-link text-light" href="index.php?controle=voiture&action=liste">Nos véhicules</a></li>
                <li class="nav-item"><a class="nav-link text-light" href="index.php?controle=facture&action=liste">Mes factures</a></li>
                <?php
                    if ($_SESSION["utilisateur"]["role"] === "admin") {
                        echo '<li class="nav-item"><a class="nav-link text-light" href="index.php?controle=admin&action=dashboard">Dashboard (admin)</a></li>';
                    }
                ?>
            </ul><span class="navbar-text actions"><a class="login" href="index.php?controle=utilisateur&action=deconnexion">Déconnexion</a></span>
        </div>
    </div>
</nav>