DROP FUNCTION IF EXISTS tarif_duplicate_cat;
DELIMITER ;;
	CREATE DEFINER=CURRENT_USER() FUNCTION `tarif_duplicate_cat`(_id_tarif INT, _id_cat_src INT,_id_cat_dst INT) RETURNS int(10)
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
							RETURN _id_tarif;
						END;;
DELIMITER ;
		
	SET @id_revision = 1;
	SET @tmp = tarif_duplicate_cat(143,2,6);