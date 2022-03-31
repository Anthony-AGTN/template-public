#Requête de purge des dossiers DEVIS de plus de 30 jours

#Pour les sociétés n'utilisant pas l'universal statut

/*Requête pour passer l'état contrat à "Annulé", le véhicule à "NULL" sur un contrat et désactiver le mouvement associé
quand le contrat est en devis et à plus de 30 jours*/

UPDATE contrats AS c,
mouvements AS m 
SET 
c.id_etat_contrat = 4,
c.id_vehicule_location = NULL,
m.activer = 0
WHERE
c.id_etat_contrat = 1 
AND c.date_crea <= NOW() - INTERVAL 30 DAY  
AND c.id_mouvement = m.id_mouvement;


/*Requête pour passer le véhicule à "NULL" sur une facture
quand le contrat associé est état Annulé */

UPDATE factures AS f
INNER JOIN contrats AS c ON c.id_contrat = f.id_contrat 
SET 
f.id_vehicule = NULL 
WHERE
c.id_etat_contrat = 4;