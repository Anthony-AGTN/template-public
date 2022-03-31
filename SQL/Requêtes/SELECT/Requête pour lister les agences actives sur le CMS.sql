-- Requête pour lister les agences actives sur le CMS

SELECT
agences.id_webloc AS 'COD_AS400',
agences.raison_sociale AS 'DESCRIPTION',
agences.ville_web AS 'VILLE WEB',
CONCAT_WS('  ',agences.adresse,agences.adresse_suite) AS 'ADDRESS',
agences.ville AS 'CITY',
agences.cp AS 'POSTAL CODE',
agences.tel AS 'TEL',
agences.fax AS 'FAX',
agences.horaires AS 'OPENING HOURS',
agences.email AS 'EMAIL',
agences_gmap.longitude AS 'LONGITUDE',
agences_gmap.latitude AS 'LATITUDE'

FROM agences

LEFT JOIN agences_gmap ON agences_gmap.id_agence = agences.id_agence

WHERE
agences.actif = 1;