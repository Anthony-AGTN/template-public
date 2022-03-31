SELECT
contrats.id_contrat,
contrats.id_etat_contrat,
contrats.id_universal_status,
contrats.num_contrat,
mouvements.id_mouvement,
mouvements.activer,
mouvements.statut_clos
FROM
contrats
INNER JOIN mouvements ON contrats.id_mouvement = mouvements.id_mouvement
WHERE
contrats.id_universal_status = 1 
AND contrats.date_crea <= NOW() - INTERVAL 7 DAY;