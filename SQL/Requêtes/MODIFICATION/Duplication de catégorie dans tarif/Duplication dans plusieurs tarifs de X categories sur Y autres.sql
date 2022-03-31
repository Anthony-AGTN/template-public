DROP FUNCTION IF EXISTS tarif_duplicate_cat;
DROP PROCEDURE IF EXISTS tarif_duplicate_cat;
DELIMITER ;;
	CREATE DEFINER=CURRENT_USER() PROCEDURE `tarif_duplicate_cat`(_id_tarif INT, _id_cat_src INT,_id_cat_dst INT)
						BEGIN
							DECLARE v_id_methode_cursor INT DEFAULT NULL;
							DECLARE v_id_methode INT DEFAULT NULL;
							DECLARE done INT DEFAULT 0;
							DECLARE cursor_tarif CURSOR FOR SELECT id_methode FROM tarifs_has_methodes WHERE id_cat_vehi = _id_cat_src AND id_tarif = _id_tarif;
							DECLARE CONTINUE HANDLER FOR SQLSTATE '02000' SET done = 1;
							OPEN cursor_tarif;
							REPEAT
								FETCH cursor_tarif INTO v_id_methode_cursor;
									IF NOT done THEN
									SET v_id_methode = methode_duplicate(v_id_methode_cursor, 1);
										IF v_id_methode IS NOT NULL THEN
											INSERT INTO tarifs_has_methodes (id_tarif, id_methode, id_cat_vehi) VALUES (_id_tarif, v_id_methode, _id_cat_dst);
										END IF;	
									END IF;
							UNTIL done END REPEAT;
							CLOSE cursor_tarif;
						END;;
DELIMITER ;


DROP PROCEDURE IF EXISTS tarifs_duplicate_cats;
DELIMITER ;;
	CREATE DEFINER=CURRENT_USER() PROCEDURE `tarifs_duplicate_cats`()
						BEGIN
							DECLARE v_id_tarif INT DEFAULT NULL;
							DECLARE v_id_cat_src INT DEFAULT NULL;
							DECLARE v_id_cat_dst INT DEFAULT NULL;
							DECLARE done INT DEFAULT 0;
							DECLARE cursor_tarif CURSOR FOR SELECT DISTINCT
thm.id_tarif,
thm.id_cat_vehi as cat_source,
(SELECT id_cat_vehi from categorie_vehicule AS dc
WHERE dc.nom_cat =
CASE c.nom_cat
WHEN 'A-5P' THEN 'A-BERLINE-2019'
WHEN 'CLA' THEN 'CLA-COUPE-2019'
WHEN 'B' THEN 'B-2019'
WHEN 'GLE-SUV' THEN 'GLE-SUV-2019'
END) AS cat_dest
FROM
tarifs_has_methodes AS thm
inner join tarifs as t on t.id_tarif = thm.id_tarif
inner join categorie_vehicule as c on c.id_cat_vehi = thm.id_cat_vehi
WHERE t.num_tarif in ('T2-100010',	'T2-100009',	'T2-100006',	'T-10000031',	'T-10000030',	'T-10000029',	'T-10000028',	'T-10000027',	'T-10000026',	'T-10000025',	'T-10000024',	'T-10000023',	'T-10000022',	'T-10000021',	'T-10000020',	'T-10000019',	'T-10000017',	'T-10000016',	'T-10000015',	'T-10000007')
and c.nom_cat in ('A-5P','CLA','B','GLE-SUV');

							DECLARE CONTINUE HANDLER FOR SQLSTATE '02000' SET done = 1;

	INSERT INTO revisions (date_revision) VALUES (NOW());
	SET @id_revision = LAST_INSERT_ID();

							OPEN cursor_tarif;
							REPEAT
								FETCH cursor_tarif INTO v_id_tarif, v_id_cat_src, v_id_cat_dst;
									IF NOT done THEN
										call tarif_duplicate_cat(v_id_tarif, v_id_cat_src, v_id_cat_dst);
									END IF;
							UNTIL done END REPEAT;
							CLOSE cursor_tarif;
						END;;
DELIMITER ;
call tarifs_duplicate_cats();