--Requête permettant de mettre à jour la table produits par rapport à un tarif / méthode / catégorie

UPDATE produits 

INNER JOIN methodes_has_produits ON produits.id_produit = methodes_has_produits.id_produit 
INNER JOIN methodes ON methodes_has_produits.id_methode = methodes.id_methode 
INNER JOIN tarifs_has_methodes ON methodes_has_produits.id_methode = tarifs_has_methodes.id_methode 
INNER JOIN categorie_vehicule ON tarifs_has_methodes.id_cat_vehi = categorie_vehicule.id_cat_vehi 

SET produits.montant = 111 

WHERE 

tarifs_has_methodes.id_tarif =107 

AND categorie_vehicule.nom_cat = 'HD 4T8' 

AND produits.lib_produit = 'FORFAIT LOCATION' 

AND methodes.lib_methode = 'AGENCE 2020 - 2-3 JOURS - 600 KMS';