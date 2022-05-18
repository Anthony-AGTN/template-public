<?php

$welcomeMessage = 'Hello Wilder !!!';

/* Maintenant formaté avec l'ISO8601*/
$dateNow = new DateTime();
$dateNow = $dateNow->format(DateTime::ISO8601);

/* Le 20 novembre 2022 à 14h00 (heure d'hiver) formaté avec l'ISO8601*/
$dateWinter = new DateTime('2022-11-20 14:00:00');
$dateWinter = $dateWinter->format(DateTime::ISO8601);

/* Le 20 juillet 2022 à 14h00 (heure d'été) formaté avec l'ISO8601*/
$dateSummer = new DateTime('2022-07-20 14:00:00');
$dateSummer = $dateSummer->format(DateTime::ISO8601);

/* Maintenant avec le fuseau horaire de Tokyo et formaté avec l'ISO8601*/
$timeZoneTokyo = new DateTimeZone('Asia/Tokyo');
$dateNowTokyo = new DateTime('now', $timeZoneTokyo);
$dateNowTokyo = $dateNowTokyo->format(DateTime::ISO8601);

/* Maintenant avec le fuseau horaire de la Martinique et formaté avec l'ISO8601*/
$dateNowMartinique = new DateTime('now', new DateTimeZone('America/Martinique'));
$dateNowMartinique = $dateNowMartinique->format(DateTime::ISO8601);

/* Maintenant avec le fuseau horaire de Melbourne et formaté avec l'ISO8601*/
$dateNowMelbourne = new DateTime('now Australia/Melbourne');
$dateNowMelbourne = $dateNowMelbourne->format(DateTime::ISO8601);

/* Liste des fuseaux horaires */
$listDateTimeZone = DateTimeZone::listIdentifiers();

/* Maintenant avec le fuseau horaire sélectionné dans la liste et formaté avec l'ISO8601*/
$dateTimeZonePost = 'Europe/Paris';
$errorMessage = '';
if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    if (empty($_POST['dateTimeZone'])) {
        $errorMessage = 'Veuillez sélectionner un fuseau horaire';
    } else {
        $dateTimeZonePost = $_POST['dateTimeZone'];
    }
}
$dateNowForDateTimeZonePost = new DateTime('now', new DateTimeZone($dateTimeZonePost));
$dateNowForDateTimeZonePost = $dateNowForDateTimeZonePost->format(DateTime::ISO8601);

/* Différence entre le 20 juillet 1988 et maintenant */
$dateNowForDiff = new DateTime();
$birthDayAnthony = new DateTime('1988-07-20 03:40:00');
$dateDiffBetweenBirthDayAnthonyAndNow = $dateNowForDiff->diff($birthDayAnthony);

?>

<!DOCTYPE html>
<html lang="fr">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <!-- CSS only -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-0evHe/X+R7YkIZDRvuzKMRqM+OrBnVFBL6DOitfPri4tjfHxaWutUpFmBp4vmVor" crossorigin="anonymous">
    <!-- JavaScript Bundle with Popper -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js" integrity="sha384-pprn3073KE6tl6bjs2QrFaJGz5/SUsLqktiwsUTF55Jfv3qYSDhgCecCxMW52nD2" crossorigin="anonymous"></script>
    <link rel="stylesheet" href="style.css">
    <title>Retour vers le futur</title>
</head>

<body>

    <div class="container mb-5">

        <h1><?= $welcomeMessage ?></h1>
        <h2>Date Now</h2>
        <h3><?= $dateNow ?></h3>
        <h2>Date Winter</h2>
        <h3><?= $dateWinter ?></h3>
        <h2>Date Summer</h2>
        <h3><?= $dateSummer ?></h3>
        <h2>Date Now Tokyo</h2>
        <h3><?= $dateNowTokyo ?></h3>
        <h2>Date Now Martinique</h2>
        <h3><?= $dateNowMartinique ?></h3>
        <h2>Date Now Melbourne</h2>
        <h3><?= $dateNowMelbourne ?></h3>

        <h2>List of date time zone</h2>
        <form action="" method="post">
            <label for="pet-select">Choose Date Time Zone:</label>
            <select name="dateTimeZone" id="dateTimeZone">
                <option value="">Please choose a Date Time Zone</option>
                <?php foreach ($listDateTimeZone as $dateTimeZone) {
                    echo '<option value="' . $dateTimeZone . '">' . $dateTimeZone . '</option>';
                } ?>
            </select>
            <button type="submit">Validate</button>
        </form>

        <?php
        if ($errorMessage) {
            echo '<h4>' . $errorMessage . '</h4>';
        }
        ?>
        <h2>Date Now for <?= $dateTimeZonePost ?></h2>
        <h3><?= $dateNowForDateTimeZonePost ?></h3>

        <h2>Date Diff Between BirthDay Anthony And Now</h2>
        <p>Number of years : <?= $dateDiffBetweenBirthDayAnthonyAndNow->y ?></p>
        <p>Number of months : <?= $dateDiffBetweenBirthDayAnthonyAndNow->m ?></p>
        <p>Number of days : <?= $dateDiffBetweenBirthDayAnthonyAndNow->d ?></p>
        <p>Number of hours : <?= $dateDiffBetweenBirthDayAnthonyAndNow->h ?></p>
        <p>Number of minutes : <?= $dateDiffBetweenBirthDayAnthonyAndNow->i ?></p>
        <p>Number of seconds : <?= $dateDiffBetweenBirthDayAnthonyAndNow->s ?></p>
        <p>Number of microseconds, as a fraction of a second : <?= $dateDiffBetweenBirthDayAnthonyAndNow->f ?></p>
        <p>Vaut 1 si l'intervalle représente une période de temps négative, 0 sinon : <?= $dateDiffBetweenBirthDayAnthonyAndNow->invert ?></p>
        <p>Days nombre de jours entre les deux dates: <?= $dateDiffBetweenBirthDayAnthonyAndNow->days ?></p>

    </div>

</body>

</html>