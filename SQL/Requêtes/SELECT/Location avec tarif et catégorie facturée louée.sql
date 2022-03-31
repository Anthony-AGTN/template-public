SELECT
contrats.num_contrat AS 'Numéro de contrat',
mouvements.date_depart AS 'Date de départ',
mouvements.date_retour_reelle AS 'Date de retour réelle',
CONCAT_WS(' ',uti_payable.nom,uti_payable.prenom) AS 'Payable',
CONCAT_WS(' ',uti_locataire.nom,uti_locataire.prenom) AS 'Locataire',
CONCAT_WS(' ',uti_conducteur.nom,uti_conducteur.prenom) AS 'Conducteur',
tarifs.lib_tarif AS 'Tarif',
methodes.lib_methode AS 'Méthode',
cat_facturation.nom_cat AS 'Catégorie facturée',
cat_location.nom_cat AS 'Catégorie louée',
vehicules.immatriculation AS 'Immat véhicule loué',
modele_vehicule.code_modele AS 'Modèle vehicule loué'
FROM contrats
INNER JOIN utilisateur AS uti_payable ON uti_payable.id_utilisateur = contrats.id_payable
INNER JOIN utilisateur AS uti_locataire ON uti_locataire.id_utilisateur = contrats.id_locataire
INNER JOIN utilisateur AS uti_conducteur ON uti_conducteur.id_utilisateur = contrats.id_conducteur
INNER JOIN tarifs ON tarifs.id_tarif = contrats.id_tarif
INNER JOIN methodes ON methodes.id_methode = contrats.id_methode
INNER JOIN categorie_vehicule AS cat_facturation ON cat_facturation.id_cat_vehi = contrats.id_categorie_facturation
INNER JOIN categorie_vehicule AS cat_location ON cat_location.id_cat_vehi = contrats.id_categorie_location
INNER JOIN mouvements ON mouvements.id_mouvement = contrats.id_mouvement
INNER JOIN vehicules ON vehicules.id_vehicule = mouvements.id_vehicule
INNER JOIN modele_vehicule ON modele_vehicule.id_modele_vehicule = vehicules.id_modele_vehicule
WHERE
uti_conducteur.nom = 'BASSANO'
AND contrats.date_crea > '2019-01-01'
AND contrats.id_etat_contrat = 3
AND contrats.id_universal_status = 13;