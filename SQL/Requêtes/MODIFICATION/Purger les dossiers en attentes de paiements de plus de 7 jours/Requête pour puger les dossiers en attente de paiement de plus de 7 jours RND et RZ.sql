#Requête de purge des dossiers "En attente de paiement"

#Pour RND et RENTIZ

/*Requête pour passer l'universal statut à "Supprimer", l'état contrat à "Annuler", le véhicule à "NULL" sur un contrat et désactiver le mouvement associé
quand le contrat est en attente de paiement et à plus de 7 jours*/ 

UPDATE contrats AS c,
mouvements AS m 
SET c.id_universal_status = 2,
c.id_etat_contrat = 4,
c.id_vehicule_location = NULL,
m.activer = 0
WHERE
c.id_universal_status = 1 
AND c.date_crea <= NOW() - INTERVAL 7 DAY  
AND c.id_mouvement = m.id_mouvement;


/*Requête pour passer le véhicule à "NULL" sur une facture
quand le contrat associé est en universal statut "Supprimé" */

UPDATE factures AS f
INNER JOIN contrats AS c ON c.id_contrat = f.id_contrat 
SET 
f.id_vehicule = NULL 
WHERE
c.id_universal_status = 2;