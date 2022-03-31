--Créer une table temporaire

create temporary table tmp_methodes_to_replace as 
SELECT
distinct methodes.id_methode
FROM
tarifs
INNER JOIN tarifs_has_methodes ON tarifs_has_methodes.id_tarif = tarifs.id_tarif
INNER JOIN methodes ON tarifs_has_methodes.id_methode = methodes.id_methode
WHERE 
tarifs.id_tarif IN ('35', '36', '37', '38');

--Afficher la nouvelle table temporaire

select * from tmp_methodes_to_replace;