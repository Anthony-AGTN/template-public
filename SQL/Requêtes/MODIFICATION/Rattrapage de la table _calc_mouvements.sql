#################################
# Requête avec plusieurs SELECT #
#################################
SET @mouvement_id = 906234;

INSERT INTO `webloc_fordrent_prod`.`_calc_mouvements` (
  `id_calc_mouvement`,
  `id_mouvement`,
  `id_contrat`,
  `id_categorie_mouvement`,
  `id_categorie_vehicule`,
  `id_type_mouvement`,
  `id_type_contrat`,
  `id_etat_contrat`,
  `id_universal_status`,
  `id_agence_depart`,
  `id_agence_retour_calc`,
  `id_vehicule`,
  `id_payable`,
  `id_locataire`,
  `statut_clos_mouvement`,
  `date_depart`,
  `date_retour_calc`,
  `date_entree_reelle`,
  `date_sortie_reelle`,
  `immatriculation`,
  `num_contrat`,
  `nom_cat_mouvement`,
  `nom_cat_vehicule`,
  `mouvement_activer`,
  `km_depart`
)
VALUES
  (
    NULL,
    @mouvement_id,
    (SELECT contrats.id_contrat FROM contrats WHERE contrats.id_mouvement = @mouvement_id),
    (SELECT mouvements.id_cat_vehi FROM mouvements WHERE mouvements.id_mouvement = @mouvement_id),
    (SELECT mouvements.id_cat_vehi FROM mouvements WHERE mouvements.id_mouvement = @mouvement_id),
    (SELECT mouvements.id_type_mouvement FROM mouvements WHERE mouvements.id_mouvement = @mouvement_id),
    (SELECT contrats.id_type_contrat FROM contrats WHERE contrats.id_mouvement = @mouvement_id),
    (SELECT contrats.id_etat_contrat FROM contrats WHERE contrats.id_mouvement = @mouvement_id),
    NULL,
    (SELECT mouvements.id_agence_depart FROM mouvements WHERE mouvements.id_mouvement = @mouvement_id),
    (SELECT mouvements.id_agence_retour FROM mouvements WHERE mouvements.id_mouvement = @mouvement_id),
    (SELECT mouvements.id_vehicule FROM mouvements WHERE mouvements.id_mouvement = @mouvement_id),
    (SELECT contrats.id_payable FROM contrats WHERE contrats.id_mouvement = @mouvement_id),
    (SELECT mouvements.id_locataire FROM mouvements WHERE mouvements.id_mouvement = @mouvement_id),
    (SELECT mouvements.statut_clos FROM mouvements WHERE mouvements.id_mouvement = @mouvement_id),
    (SELECT mouvements.date_depart FROM mouvements WHERE mouvements.id_mouvement = @mouvement_id),
    (SELECT mouvements.date_retour FROM mouvements WHERE mouvements.id_mouvement = @mouvement_id),
    (SELECT vehicules.date_entree_reelle FROM vehicules INNER JOIN mouvements ON mouvements.id_vehicule = vehicules.id_vehicule WHERE mouvements.id_mouvement = @mouvement_id),
    NULL,
    (SELECT vehicules.immatriculation FROM vehicules INNER JOIN mouvements ON mouvements.id_vehicule = vehicules.id_vehicule WHERE mouvements.id_mouvement = @mouvement_id),
    (SELECT contrats.num_contrat FROM contrats WHERE contrats.id_mouvement = @mouvement_id),
    (SELECT categorie_vehicule.nom_cat FROM categorie_vehicule INNER JOIN mouvements ON mouvements.id_cat_vehi = categorie_vehicule.id_cat_vehi WHERE mouvements.id_mouvement = @mouvement_id),
    (SELECT categorie_vehicule.nom_cat FROM categorie_vehicule INNER JOIN mouvements ON mouvements.id_cat_vehi = categorie_vehicule.id_cat_vehi WHERE mouvements.id_mouvement = @mouvement_id),
    (SELECT mouvements.activer FROM mouvements WHERE mouvements.id_mouvement = @mouvement_id),
  (SELECT mouvements.km_depart FROM mouvements WHERE mouvements.id_mouvement = @mouvement_id)
  );
##############################
# Requête avec 1 seul SELECT #
##############################
INSERT INTO webloc_fordrent_prod._calc_mouvements (
  id_calc_mouvement,
  id_mouvement,
  id_contrat,
  id_categorie_mouvement,
  id_categorie_vehicule,
  id_type_mouvement,
  id_type_contrat,
  id_etat_contrat,
  id_universal_status,
  id_agence_depart,
  id_agence_retour_calc,
  id_vehicule,
  id_payable,
  id_locataire,
  statut_clos_mouvement,
  date_depart,
  date_retour_calc,
  date_entree_reelle,
  date_sortie_reelle,
  immatriculation,
  num_contrat,
  nom_cat_mouvement,
  nom_cat_vehicule,
  mouvement_activer,
  km_depart
) SELECT
  NULL,
  @mouvement_id,
  contrats.id_contrat,
  mouvements.id_cat_vehi,
  mouvements.id_cat_vehi,
  mouvements.id_type_mouvement,
  contrats.id_type_contrat,
  contrats.id_etat_contrat,
  NULL,
  mouvements.id_agence_depart,
  mouvements.id_agence_retour,
  mouvements.id_vehicule,
  contrats.id_payable,
  mouvements.id_locataire,
  mouvements.statut_clos,
  mouvements.date_depart,
  mouvements.date_retour,
  vehicules.date_entree_reelle,
  NULL,
  vehicules.immatriculation,
  contrats.num_contrat,
  categorie_vehicule.nom_cat,
  categorie_vehicule.nom_cat,
  mouvements.activer,
  mouvements.km_depart
FROM mouvements
WHERE mouvements.id_mouvement = @mouvement_id
LEFT JOIN contrats ON contrats.id_mouvement = mouvements.id_mouvement
LEFT JOIN vehicules ON mouvements.id_vehicule = vehicules.id_vehicule
LEFT JOIN categorie_vehicule ON mouvements.id_cat_vehi = categorie_vehicule.id_cat_vehi;
