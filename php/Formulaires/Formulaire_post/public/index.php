<?php

require('../connec.php');

$pdo = new PDO(DSN, USER, PASS);

$query = "SELECT * FROM friend";
$statement = $pdo->query($query);
$friends = $statement->fetchAll();

?>

<!DOCTYPE html>
<html lang="fr">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>PDO un ami pour la vie</title>
</head>

<body>
    <h1>Bienvenue chez les Friends</h1>
    <section>
        <h2>Liste des friends</h2>
        <ul>
            <?php
            foreach ($friends as $friend) {
                echo '<li>' . htmlentities($friend['firstname']) . ' ' . htmlentities($friend['lastname']) . '</li>';
            }
            ?>
        </ul>
    </section>
    <section>
        <form action="" method="post">
            <div>
                <label for="firstname">Prénom :</label>
                <input type="text" id="firstname" name="user_firstname" placeholder="First Name">
            </div>
            <div>
                <label for="lastname">Nom :</label>
                <input type="text" id="lastname" name="user_lastname" placeholder="Last Name">
            </div>
            <div class="button">
                <button type="submit">Submit your name</button>
            </div>
        </form>
    </section>

    <?php

    if ($_SERVER["REQUEST_METHOD"] === 'POST') {

        $datas = array_map('trim', $_POST);

        $errors = [];

        if (empty($datas['user_firstname']))
            $errors[] = 'Votre prénom est obligatoire.';

        if (strlen($datas['user_firstname']) > 45)
            $errors[] = 'Votre prénom ne doit pas excéder 45 caractères.';

        if (empty($datas['user_lastname']))
            $errors[] = 'Votre nom est obligatoire.';

        if (strlen($datas['user_lastname']) > 45)
            $errors[] = 'Votre nom ne doit pas excéder 45 caractères.';

        if (empty($errors)) {

            $query = 'INSERT INTO friend (firstname, lastname) VALUES (:firstname, :lastname)';
            $statement = $pdo->prepare($query);

            $statement->bindValue(':firstname', $datas['user_firstname'], \PDO::PARAM_STR);
            $statement->bindValue(':lastname', $datas['user_lastname'], \PDO::PARAM_STR);

            $statement->execute();

            echo "<meta http-equiv='refresh' content='0'>";
        } else {

            foreach ($errors as $error) {
                echo '<h2>' . $error . '</h2>';
            }
        }
    }

    ?>

</body>

</html>