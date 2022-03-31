<!-- VALIDATION CÔTÉ CLIENT -->

        <label for="firstname">Firstname</label>
        <input type="text" 
                name="first_name" 
                id="firstname"
                placeholder="John"
                pattern="^[a-zA-Z] [a-zA-Z0-9-_\.]{1,20}$"
                minlength="1"
                maxlength="20"
                size="10"
                required>


<!-- EXEMPLE SELECT HTML VS PHP -->

        <!-- HTML -->
        <label for="pet-selct">Choose a pet:</label>
        <select id="pet-select">
            <option value="dog">Dog</option>
            <option value="cat">Cat</option>
            <option value="goldfish">Goldfish</option>
        </select>

        <!-- PHP -->
        <?php
            $pets = ['Dog', 'Cat', 'Goldfish'];
        ?>

        <label for="pet-selct">Choose a pet:</label>
        <select id="pet-select">
            <?php foreach($pets as $pet): ?>
                <option value="<?= strtolower($pet); ?>">
                    <?= $pet; ?>
                </option>
            <?php endforeach; ?>
        </select>
<?php

// SÉCURISATION CÔTÉ SERVEUR

        // NETTOYAGE DES ESPACES INUTILES OU INTENTIONNELS
        $datas = array_map('trim', $_POST);

        // NETTOYAGE DE NUMÉROS DE TÉLÉPHONE
        if (filter_var($datas['phonenumber'], FILTER_SANITIZE_NUMBER_INT))

        // FAILLE XSS : EVITER LES INJECTIONS DE CODE TIERS SUR UNE PAGE
?>      <h2>
            <?= htmlentities($datas[$data]) ?>
        </h2>
<?php

// VALIDATION CÔTÉ SERVEUR

        // CRÉATION D'UN TABLEAU D'ERREURS
        $errors = [];

        // CHAMPS REQUIS
        if (empty($datas['firstname']))
            $errors[] = 'The firstname is mandatory';
        
        // LONGUEUR MAX D'UNE CHAÎNE
        if (strlen($datas['firstname']) > 1000)
            $errors[] = 'The firstname length should be less than 100 characters';
        
        // VALIDATION D'ADRESSE EMAIL
        if (!filter_var($datas['email'], FILTER_VALIDATE_EMAIL))
            $errors[] = 'This email address is not valid';

        //VALIDATION D'UNE URL
        if (!filter_var($datas['url'], FILTER_VALIDATE_URL))
            $errors[] = 'This URL format is not correct';

        // VALIDATION D'UN ÂGE
        if (!filter_var($datas['age'], FILTER_VALIDATE_INT) && ($datas['age'] < 0 && $datas['age'] > 125))
            $errors[] = 'There is a problem about your age';

        // CONVERTION D'UNE CHAÎNE DE CARACTÈRES EN SON ÉQUIVALENT BOOLÉEN
        $sendMeNewsLetter = 'yes';
        var_dump(filter_var($sendMeNewsLetter, FILTER_VALIDATE_BOOLEAN));
            // TRUE
        $rememberMe = 'forever';
        var_dump(filter_var($rememberMe, FILTER_VALIDATE_BOOLEAN, FILTER_NULL_ON_FAILURE));
            // null

        // ETC : VOIR DOCUMENTATION (https://www.php.net/manual/fr/function.filter-var.php)

        // SORTIE DE VALIDATION

        if (!empty($errors))
        {
            // DISPLAY ERRORS
        } else {
            // DATA TREATMENT AND REDIRECTION
            header('Location: /index.php');
        }
