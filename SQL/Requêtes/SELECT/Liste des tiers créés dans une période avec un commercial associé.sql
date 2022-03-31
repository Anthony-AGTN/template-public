#####################################################################
# Liste des tiers créés dans une période avec un commercial associé #
#####################################################################
SELECT
CONCAT_WS(' ',com.prenom,com.nom) AS 'Commercial',
utilisateur.date_crea 'Date de création',
utilisateur.id_utilisateur AS 'Id du tiers',
type_civilite.tci_lib AS 'Civilité',
utilisateur.nom AS 'Nom',
utilisateur.prenom AS 'Prénom',
utilisateur.nom_societe AS 'Nom de société',
utilisateur.email AS 'Email',
voie.label AS 'Voie',
utilisateur.numero AS 'Numéro de voie',
utilisateur.batiment AS 'Batiment',
utilisateur.adresse AS 'Adresse',
utilisateur.adresse2 AS 'Adresse 2',
utilisateur.cp AS 'CP',
utilisateur.ville AS 'Ville',
utilisateur.tel AS 'Tel',
utilisateur.tel_mobile AS 'Tel mobile',
utilisateur.tel_pro AS 'Tel pro'
FROM
utilisateur
INNER JOIN utilisateur AS com ON com.id_utilisateur = utilisateur.id_commercial
INNER JOIN type_civilite ON type_civilite.id_type_civilite = utilisateur.civilite
LEFT JOIN lists_items AS voie ON voie.id_list_item = utilisateur.voie
WHERE
utilisateur.date_crea BETWEEN '2021-01-01 00:00:00' AND '2021-03-31 23:59:59';
