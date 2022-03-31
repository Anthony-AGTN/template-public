SELECT
contrats.num_contrat AS 'Num contrat',
types_universal_status.label_code AS 'Statut contrat',
types_statuts_facture.lib_statut_facture AS 'Statut facture',
factures.date_facturation AS 'Date de facturation',
IFNULL((SELECT SUM(reglements.montant) FROM reglements WHERE reglements.id_contrat = contrats.id_contrat AND reglements.id_type_cible_reglement = 2),0) AS 'Montant_du_DG'
FROM
contrats
INNER JOIN factures ON factures.id_contrat = contrats.id_contrat
LEFT JOIN factures AS f0 ON f0.id_facture_rattachement = factures.id_facture_rattachement AND f0.id_facture > factures.id_facture
INNER JOIN types_statuts_facture ON factures.id_statut_facture = types_statuts_facture.id_statut_facture
INNER JOIN types_universal_status ON contrats.id_universal_status = types_universal_status.id_universal_status
WHERE
f0.id_facture IS NULL AND
factures.id_statut_facture = 2 AND
contrats.id_universal_status = 13 AND
factures.date_facturation > "2019-07-01 00:00:00"
HAVING Montant_du_DG <> 0
ORDER BY num_contrat DESC;