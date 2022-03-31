#########################################################################
# Affiche les Abonnement aux exports comptables paramétrés par societes #
#########################################################################
SELECT
societes.id_societe,
societes.raison_sociale,
utilisateur_has_abonnements.tag,
utilisateur.email,
utilisateur_has_abonnements.activer,
IF(utilisateur_has_abonnements.tag IS NOT NULL AND utilisateur_has_abonnements.activer = 1,'Abonnement paramétré','Abonnement NON paramétré ou inactif') AS 'Statut'
FROM societes
LEFT JOIN utilisateur_has_abonnements ON utilisateur_has_abonnements.tag LIKE CONCAT("s=",societes.id_societe) AND utilisateur_has_abonnements.id_edition = 110
LEFT JOIN utilisateur ON utilisateur.id_utilisateur = utilisateur_has_abonnements.id_utilisateur
WHERE
societes.activer = 1
AND societes.id_societe_mere IS NULL;
