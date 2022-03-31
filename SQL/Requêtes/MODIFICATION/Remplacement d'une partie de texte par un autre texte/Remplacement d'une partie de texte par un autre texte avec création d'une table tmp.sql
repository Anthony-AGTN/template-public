--Créer une table temporaire

create temporary table tmp_methodes_to_replace as 
SELECT
distinct methodes.id_methode
FROM
tarifs
INNER JOIN tarifs_has_methodes ON tarifs_has_methodes.id_tarif = tarifs.id_tarif
INNER JOIN methodes ON tarifs_has_methodes.id_methode = methodes.id_methode
WHERE 
tarifs.id_tarif = 399;

--Afficher la nouvelle table temporaire

select * from tmp_methodes_to_replace;

--Remplacement de STD-2017 par VR-2020 dans le libellé de la méthode

UPDATE methodes
INNER JOIN tmp_methodes_to_replace ON methodes.id_methode = tmp_methodes_to_replace.id_methode
SET methodes.lib_methode = REPLACE (lib_methode, 'STD-2017', 'VR-2020')
WHERE methodes.id_methode = tmp_methodes_to_replace.id_methode;