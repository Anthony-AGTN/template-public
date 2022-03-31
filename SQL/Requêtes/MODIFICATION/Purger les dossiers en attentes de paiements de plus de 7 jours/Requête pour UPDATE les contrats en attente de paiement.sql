UPDATE contrats AS c,
mouvements AS m 
SET c.id_universal_status = 2,
c.id_etat_contrat = 4,
m.activer = 0

WHERE
	c.id_universal_status = 1 
	AND c.date_crea <= NOW() - INTERVAL 7 DAY  
	AND c.id_mouvement = m.id_mouvement;