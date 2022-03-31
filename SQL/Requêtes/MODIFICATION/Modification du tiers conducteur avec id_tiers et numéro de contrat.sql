#######################################################################
# Modification du tiers conducteur avec id_tiers et numéro de contrat #
#######################################################################
SET @contrat_num = 'C95-127831';

SET @id_new_conducteur = 58687;

UPDATE contrats
INNER JOIN mouvements ON mouvements.id_mouvement = contrats.id_mouvement
SET 
contrats.id_conducteur = @id_new_conducteur,
mouvements.id_conducteur = @id_new_conducteur
WHERE
contrats.num_contrat = @contrat_num;