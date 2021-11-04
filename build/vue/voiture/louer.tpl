<!DOCTYPE html>
<html lang="en">

<head>
    <?php require_once "./vue/header.tpl" ?>
</head>

<body>

<?php require_once "./vue/navbar/default_session.tpl" ?>

<section class="contact-clean">
    <form method="post" action="index.php?controle=voiture&action=louer&id=<?php echo $_GET["id"] ?>"><img class="img-fluid" src="./img/<?php echo $modele["photo"] ?>" alt="<?php echo $modele["photo"] ?>" style="margin-bottom: 0px;">
        <h4 class="text-center" style="margin-top: 8px;"><?php echo $modele["nomModele"] ?></h4>
        <p class="text-center"><?php echo $modele["tarifJournalier"] ?> € / jour</p>
        <?php echo $message ?>
        <div class="mb-3"><label class="form-label">Date de début *</label><input class="form-control" type="date" name="dateDebut" required></div>
        <div class="mb-3"><label class="form-label">Date de fin</label><input class="form-control" name="dateFin" type="date"></div>
        <div class="d-inline-flex justify-content-between align-items-center mb-3" style="width: 100%;">
            <div class="mb-3"><label class="form-label">Quantité<input class="form-control" type="number" min="1" max="<?php echo $max ?>" placeholder="0" name="quantite" required></label></div>
                <?php
                    if ($max > 0) {
                        echo '<button class="btn btn-primary" type="submit" style="margin-top: 0px;width: 150px;">Louer</button>';
                    }
                    else {
                        echo '<button class="btn btn-secondary" type="submit" style="margin-top: 0px;width: 150px;" disabled>Rupture</button>';
                    }
                ?>
        </div>
        <p class="text-center"><a href="index.php?controle=voiture&action=liste">Retour à la liste des modèles</a></p>
    </form>
</section>

<?php require_once "./vue/footer.tpl" ?>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/js/bootstrap.bundle.min.js"></script>
</body>

</html>