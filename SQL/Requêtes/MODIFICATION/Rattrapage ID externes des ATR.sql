################################################################################
# Rattrapage des ID externe 1 sur les produits embarqués d assurance LocAssist #
################################################################################
UPDATE produits
INNER JOIN methodes_has_produits ON methodes_has_produits.id_produit = produits.id_produit
INNER JOIN methodes ON methodes.id_methode = methodes_has_produits.id_methode
INNER JOIN tarifs_has_methodes ON tarifs_has_methodes.id_methode = methodes.id_methode
INNER JOIN tarifs ON tarifs.id_tarif = tarifs_has_methodes.id_tarif
INNER JOIN categorie_vehicule ON categorie_vehicule.id_cat_vehi = tarifs_has_methodes.id_cat_vehi
SET produits.id_externe = 1
WHERE
tarifs.activer = 1
AND methodes.activer = 1
AND produits.activer = 1
AND produits.id_famille_produit = 45
AND produits.id_externe IS NULL;
