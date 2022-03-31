SELECT
utilisateur.id_utilisateur,
utilisateur.id_societe,
(SELECT societes.raison_sociale FROM societes WHERE utilisateur.id_societe = societes.id_societe) AS Societe,
utilisateur.nom,
utilisateur.prenom,
utilisateur.login,
utilisateur.email,
#utilisateur.adresse,
#utilisateur.cp,
#utilisateur.ville,
#utilisateur.activer,
#utilisateur.date_crea,
#utilisateur.date_modif,
secteurs.id_secteur,
#secteurs.id_type_secteur,
secteurs.lib_secteur
FROM
utilisateur
INNER JOIN utilisateur_has_secteurs ON utilisateur_has_secteurs.id_utilisateur = utilisateur.id_utilisateur
INNER JOIN secteurs ON utilisateur_has_secteurs.id_secteur = secteurs.id_secteur
WHERE
utilisateur.login IS NOT NULL AND
utilisateur.passwd IS NOT NULL AND
utilisateur.activer = 1;
