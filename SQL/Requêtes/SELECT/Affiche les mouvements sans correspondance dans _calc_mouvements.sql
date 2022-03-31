SELECT
mouvements.id_mouvement,
_calc_mouvements.id_calc_mouvement,
contrats.num_contrat
FROM mouvements
LEFT JOIN _calc_mouvements ON _calc_mouvements.id_mouvement = mouvements.id_mouvement
LEFT JOIN contrats ON contrats.id_mouvement = mouvements.id_mouvement
WHERE _calc_mouvements.id_calc_mouvement IS NULL;
