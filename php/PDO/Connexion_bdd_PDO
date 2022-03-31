<?php

//Avec PDO, tu devras initialiser une connexion au début de ton code PHP (avant d'effectuer la moindre requête SQL), selon la syntaxe suivante :

$pdo = new PDO('mysql:host=localhost;dbname=database_name', 'wilder_username', 'wilder_password');

//Pour plus de confidentialité déclarer les variables de connexion dans un fichier '_connect.php' à part et non versionné (ajouter le fichier dans le .gitignore) :
//'_connec.php'
define("DSN", "database");
define("USER", "user");
define("PASS", "password");

//Puis utiliser les variables dans l'instance à créer :

require_once '_connec.php';

$pdo = new PDO('mysql:host=localhost;dbname=' . DSN . ';charset=utf8', USER, PASS);

//SELECT - Récupérer dans une variable $friends tous le contenu de la table friend :

$query = "SELECT * FROM friend";
$statement = $pdo->query($query);
$friends = $statement->fetchAll();

//INSERT INTO - Insertion de données firstname et lastname dans la table friend :

$query = "INSERT INTO friend (firstname, lastname) VALUES ('Chandler', 'Bing')";
$statement = $pdo->exec($query);

//UPDATE - Modifier dans la table friend le first name en 'Anthony' quand l'id est égal à 1 :

$query = "UPDATE friend SET firstname = 'Anthony' WHERE id = 1";
$statement = $pdo->exec($query);

//DELETE - Supprimer dans la table friend l'enregistrement quand l'id est égal à 1 :

$query = "DELETE FROM friend WHERE `id` = 1";
$statement = $pdo->exec($query);

//INSERT INTO - Insertion de données firstname et lastname dans la table friend :
//Avec traitement pour éviter les attaques par injection de requête SQL.

    $firstname = trim($_POST['firstname']); 
    $lastname = trim($_POST['lastname']);
    
    $query = 'INSERT INTO friend (firstname, lastname) VALUES (:firstname, :lastname)';
    $statement = $pdo->prepare($query);
    
    $statement->bindValue(':firstname', $firstname, \PDO::PARAM_STR);
    $statement->bindValue(':lastname', $lastname, \PDO::PARAM_STR);
    
    $statement->execute();
    
    $friends = $statement->fetchAll(); //une fois la requête exécutée, la méthode fetchAll() est là encore disponible pour récupérer les valeurs


//Récupération des données

//fetch() permet de récupérer un seul résultat.

$friends = $statement->fetch();

//fetchAll() retourne tous les résultats de la requête, sous la forme d'un tableau avec une ligne par enregistrement.

$friends = $statement->fetchAll();

// FETCH_BOTH : c'est la valeur par défaut si tu n'indiques rien. Le format de sortie est un peu particulier, car sous la forme d'un double tableau indexé numériquement ET associatif (les valeurs y sont donc répétées deux fois chacune).

$friends = $statement->fetchAll(PDO::FETCH_BOTH); // same as $statement->fetchAll()

//FETCH_ASSOC : Dans la plupart des cas, tu souhaiteras traiter ton tableau uniquement comme un tableau associatif, avec les noms de champ en clés et les données en valeurs. C'est ce que propose ce style de fetch

$friends = $statement->fetchAll(PDO::FETCH_ASSOC);

//FETCH_NUM : renvoie un tableau indexé numériquement (dans ce cas, le nom du champ n'est donc pas retourné). Le FETCH_BOTH est donc la combinaison de FETCH_ASSOC et FETCH_NUM.

$friends = $statement->fetchAll(PDO::FETCH_NUM);

//FETCH_OBJ : renvoie un tableau d'objets. Ainsi, il sera possible d'accéder aux champs de chaque élément avec une syntaxe objet de cette manière là : $data[0]->firstname

$friends = $statement->fetchAll(PDO::FETCH_OBJ);

//FETCH_CLASS : ce style est également très utile, car il permet de transformer les résultats directement en objet d'une classe prédéterminée. Il sera très utile pour une approche "tout objet" du code.

$friends = $statement->fetchAll(PDO::FETCH_CLASS);

//Une fois les valeurs de la requête récupérées via un fetchAll(), tu n'as plus qu'à boucler dessus pour manipuler les données une à une :

$friends = $statement->fetchAll(PDO::FETCH_ASSOC);

foreach($friends as $friend) {
    echo $friend['firstname'] . ' ' . $friend['lastname'];
}

//ou alors

$friends = $statement->fetchAll(PDO::FETCH_OBJ);

foreach($friends as $friend) {
    echo $friend->firstname . ' ' . $friend->lastname;
}
