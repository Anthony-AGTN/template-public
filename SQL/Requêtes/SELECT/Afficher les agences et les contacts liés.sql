#############################################
# Afficher les agences et les contacts liés #
#############################################


SELECT
societes.raison_sociale,
utilisateur.id_utilisateur,
utilisateur.nom,
utilisateur.prenom,
utilisateur.email,
roles.lib_role
FROM societes
LEFT JOIN societes_has_contacts ON societes.id_societe = societes_has_contacts.id_societe
LEFT JOIN utilisateur ON utilisateur.id_utilisateur = societes_has_contacts.id_utilisateur
LEFT JOIN roles ON roles.id_role = societes_has_contacts.id_role
WHERE
societes.id_type_societe = 2
AND societes.raison_sociale LIKE '%CD'
AND societes.activer = 1;


SELECT
societes.raison_sociale,
utilisateur.id_utilisateur,
utilisateur.nom,
utilisateur.prenom,
utilisateur.email,
roles.lib_role
FROM societes
LEFT JOIN societes_has_contacts ON societes.id_societe = societes_has_contacts.id_societe
LEFT JOIN utilisateur ON utilisateur.id_utilisateur = societes_has_contacts.id_utilisateur
LEFT JOIN roles ON roles.id_role = societes_has_contacts.id_role
WHERE
societes.id_type_societe = 2
AND societes.activer = 1;
