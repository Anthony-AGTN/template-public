#Requêtes pour extract la base tiers d une société en fonction des optin email, courrier et sms

#Tiers qui accepte de recevoir des informations par email

SELECT
societes.raison_sociale AS 'Agence de création du tiers',
type_civilite.tci_lib AS 'Civilité',
utilisateur.nom AS 'Nom',
utilisateur.prenom AS 'Prénom',
utilisateur.nom_societe 'Nom de société',
utilisateur.email AS 'Email',
IF(utilisateur.optin_email = 1,'Oui','Non') AS 'Le client accepte de recevoir des informations par e-mail',
frequence.label AS 'Fréquence envoi',
preference.label AS 'Le client préfère recevoir des informations',
utilisateur.date_crea AS 'Date de création',
utilisateur.date_modif AS 'Date de modification'
FROM
utilisateur
INNER JOIN societes ON societes.id_societe = utilisateur.id_societe
LEFT JOIN type_civilite ON type_civilite.id_type_civilite = utilisateur.civilite
LEFT JOIN lists_items AS frequence ON frequence.id_list_item = utilisateur.optin_email_frequence
LEFT JOIN lists_items AS preference ON preference.id_list_item = utilisateur.optin_preference_communication
WHERE
utilisateur.id_societe IN (234, 235)
AND utilisateur.activer = 1
AND utilisateur.login IS NULL
AND utilisateur.optin_email = 1;

#Tiers qui accepte de recevoir des informations par courrier

SELECT
societes.raison_sociale AS 'Agence de création du tiers',
type_civilite.tci_lib AS 'Civilité',
utilisateur.nom AS 'Nom',
utilisateur.prenom AS 'Prénom',
utilisateur.nom_societe 'Nom de société',
utilisateur.numero AS 'Numéro',
voie.label AS 'Voie',
utilisateur.batiment AS 'Batiment',
utilisateur.adresse AS 'Adresse',
utilisateur.adresse2 AS 'Adresse 2',
utilisateur.cp AS 'Code postal',
utilisateur.pays AS 'Pays',
IF(utilisateur.optin_courrier = 1,'Oui','Non') AS 'Le client accepte de recevoir des informations par Courrier',
frequence.label AS 'Fréquence envoi',
preference.label AS 'Le client préfère recevoir des informations',
utilisateur.date_crea AS 'Date de création',
utilisateur.date_modif AS 'Date de modification'
FROM
utilisateur
INNER JOIN societes ON societes.id_societe = utilisateur.id_societe
LEFT JOIN type_civilite ON type_civilite.id_type_civilite = utilisateur.civilite
LEFT JOIN lists_items AS frequence ON frequence.id_list_item = utilisateur.optin_courrier_frequence
LEFT JOIN lists_items AS preference ON preference.id_list_item = utilisateur.optin_preference_communication
LEFT JOIN lists_items AS voie ON voie.id_list_item = utilisateur.voie
WHERE
utilisateur.id_societe IN (234, 235)
AND utilisateur.activer = 1
AND utilisateur.login IS NULL
AND utilisateur.optin_courrier = 1;

#Tiers qui accepte de recevoir des informations par sms

SELECT
societes.raison_sociale AS 'Agence de création du tiers',
type_civilite.tci_lib AS 'Civilité',
utilisateur.nom AS 'Nom',
utilisateur.prenom AS 'Prénom',
utilisateur.nom_societe 'Nom de société',
utilisateur.tel AS 'Téléphone principal',
utilisateur.tel_pro AS 'Téléphone bureau',
utilisateur.tel_mobile AS 'Téléphone mobile',
IF(utilisateur.optin_sms = 1,'Oui','Non') AS 'Le client accepte de recevoir des informations par sms',
frequence.label AS 'Fréquence envoi',
preference.label AS 'Le client préfère recevoir des informations',
utilisateur.date_crea AS 'Date de création',
utilisateur.date_modif AS 'Date de modification'
FROM
utilisateur
INNER JOIN societes ON societes.id_societe = utilisateur.id_societe
LEFT JOIN type_civilite ON type_civilite.id_type_civilite = utilisateur.civilite
LEFT JOIN lists_items AS frequence ON frequence.id_list_item = utilisateur.optin_sms_frequence
LEFT JOIN lists_items AS preference ON preference.id_list_item = utilisateur.optin_preference_communication
WHERE
utilisateur.id_societe IN (234, 235)
AND utilisateur.activer = 1
AND utilisateur.login IS NULL
AND utilisateur.optin_sms = 1;