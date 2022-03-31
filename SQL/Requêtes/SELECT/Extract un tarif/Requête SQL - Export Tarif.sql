
#Requête servant à faire l'export entier d'un tarif (pour exemple ici le tarif 107)

#Les colonnes affichées sont Tarifs / Catégories véhicule / Méthodes / Produits / Montant / TTC ou HT / Montant DG et Franchises


#Requête en préprod
SELECT
tarifs.lib_tarif AS 'Tarif',
categorie_vehicule.lib AS `Catégorie véhicule`,
methodes.lib_methode AS `Méthode`,
produits.lib_produit AS 'Produit',
produits.montant AS 'Montant',
produits.ttc AS `TTC ou HT`,
produits.franchise_reduite AS 'Montant DG et Franchise'
FROM
tarifs
INNER JOIN tarifs_has_methodes ON tarifs_has_methodes.id_tarif = tarifs.id_tarif
INNER JOIN methodes ON tarifs_has_methodes.id_methode = methodes.id_methode
INNER JOIN methodes_has_produits ON methodes_has_produits.id_methode = methodes.id_methode
INNER JOIN produits ON methodes_has_produits.id_produit = produits.id_produit
INNER JOIN categorie_vehicule ON tarifs_has_methodes.id_cat_vehi = categorie_vehicule.id_cat_vehi
WHERE
tarifs.id_tarif = 107

#Requête en prod
SELECT
tarifs.lib_tarif AS Tarif,
categorie_vehicule.lib AS 'Catégorie Véhicule',
methodes.lib_methode AS Méthode,
produits.lib_produit AS Produit,
produits.montant AS Montant,
produits.ttc AS 'TTC ou HT',
produits.franchise_reduite AS 'Montant DG / Franchise'
FROM
tarifs
INNER JOIN tarifs_has_methodes ON tarifs_has_methodes.id_tarif = tarifs.id_tarif
INNER JOIN categorie_vehicule ON tarifs_has_methodes.id_cat_vehi = categorie_vehicule.id_cat_vehi
INNER JOIN methodes ON tarifs_has_methodes.id_methode = methodes.id_methode
INNER JOIN methodes_has_produits ON methodes_has_produits.id_methode = methodes.id_methode
INNER JOIN produits ON methodes_has_produits.id_produit = produits.id_produit
WHERE
tarifs.id_tarif = 107