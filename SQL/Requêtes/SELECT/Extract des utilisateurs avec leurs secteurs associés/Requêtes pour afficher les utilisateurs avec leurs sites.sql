#Requêtes pour afficher les utilisateurs avec leurs sites

SELECT 

utilisateur.id_utilisateur,
CONCAT_WS(" ",utilisateur.prenom,utilisateur.nom) AS 'utilisateur',
utilisateur.login,

`profile`.id_profile,
`profile`.lib,

societes_affect.raison_sociale,
societes_sect.raison_sociale,
societes_sect.activer


FROM utilisateur

INNER JOIN societes AS societes_affect ON societes_affect.id_societe = utilisateur.id_societe


INNER JOIN utilisateur_has_profile ON utilisateur_has_profile.id_utilisateur = utilisateur.id_utilisateur
INNER JOIN `profile` ON `profile`.id_profile = utilisateur_has_profile.id_profile

INNER JOIN utilisateur_has_secteurs ON utilisateur_has_secteurs.id_utilisateur = utilisateur.id_utilisateur
INNER JOIN secteurs ON secteurs.id_secteur = utilisateur_has_secteurs.id_secteur
INNER JOIN secteurs_has_societes ON secteurs_has_societes.id_secteur = secteurs.id_secteur
INNER JOIN societes AS societes_sect ON societes_sect.id_societe = secteurs_has_societes.id_societe

WHERE

utilisateur.login IS NOT NULL
AND utilisateur.activer = 1;