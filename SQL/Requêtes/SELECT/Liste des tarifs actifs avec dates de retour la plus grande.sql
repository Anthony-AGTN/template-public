-- Liste des tarifs actifs avec dates de retour la plus grande

SELECT
tarifs.id_tarif,
tarifs.lib_tarif,
tarifs.date_debut_validite,
tarifs.date_fin_validite,
tarifs.activer,
MAX(mouvements.date_retour)
FROM
tarifs
LEFT JOIN contrats ON contrats.id_tarif = tarifs.id_tarif
LEFT JOIN mouvements ON contrats.id_mouvement = mouvements.id_mouvement
WHERE
tarifs.activer = 1
GROUP BY tarifs.id_tarif;