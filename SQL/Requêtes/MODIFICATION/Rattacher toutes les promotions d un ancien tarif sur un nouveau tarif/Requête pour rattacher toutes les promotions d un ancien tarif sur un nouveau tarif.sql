-- Requête pour rattacher toutes les promotions d un ancien tarif sur un nouveau tarif

/* "INSERT IGNORE INTO promotion_has_tarif" 
Permette de créer un enregistrement dans la table promtion_has_tarif
sans le créer si l'enregistement est déjà existant.*/

/*"(id_promotion, id_tarif)"
Permet de définir l'ordre des colonnes*/

/*"(SELECT id_promotion, [id nouveau tarif] FROM promotion_has_tarif WHERE id_tarif = [id ancien tarif]);"*/


INSERT IGNORE INTO promotion_has_tarif

(id_promotion, id_tarif)

(SELECT id_promotion, 35 FROM promotion_has_tarif WHERE id_tarif = 29);