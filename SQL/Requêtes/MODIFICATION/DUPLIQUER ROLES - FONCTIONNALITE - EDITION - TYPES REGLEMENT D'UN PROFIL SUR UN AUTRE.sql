-- DUPLIQUER ROLES - FONCTIONNALITE - EDITION - TYPES REGLEMENT D'UN PROFIL SUR UN AUTRE

SET @id_profile_source = 12;

SET @id_profile_destination = 1007;

DELETE FROM profile_has_roles WHERE id_profile = @id_profile_destination;
DELETE FROM profile_has_fonctionnalite WHERE id_profile = @id_profile_destination;
DELETE FROM profile_has_editions WHERE id_profile = @id_profile_destination;
DELETE FROM profile_has_types_reglement WHERE id_profile = @id_profile_destination;

INSERT IGNORE INTO profile_has_roles

(id_profile, id_role)

(SELECT @id_profile_destination, id_role FROM profile_has_roles WHERE id_profile = @id_profile_source);

INSERT IGNORE INTO profile_has_fonctionnalite

(id_profile, id_fcte)

(SELECT @id_profile_destination, id_fcte FROM profile_has_fonctionnalite WHERE id_profile = @id_profile_source);

INSERT IGNORE INTO profile_has_editions

(id_profile, id_edition)

(SELECT @id_profile_destination, id_edition FROM profile_has_editions WHERE id_profile = @id_profile_source);

INSERT IGNORE INTO profile_has_types_reglement

(id_profile, id_type_reglement)

(SELECT @id_profile_destination, id_type_reglement FROM profile_has_types_reglement WHERE id_profile = @id_profile_source);