--Requête permettant de mettre à jour la table produits par rapport à un tarif

UPDATE produits

INNER JOIN methodes_has_produits ON produits.id_produit = methodes_has_produits.id_produit
INNER JOIN methodes ON methodes_has_produits.id_methode = methodes.id_methode
INNER JOIN tarifs_has_methodes ON methodes.id_methode = tarifs_has_methodes.id_methode
INNER JOIN tarifs ON tarifs_has_methodes.id_tarif = tarifs.id_tarif

SET

produits.montant = 0

WHERE

tarifs.id_tarif = 399;