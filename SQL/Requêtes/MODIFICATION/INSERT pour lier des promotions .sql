INSERT IGNORE INTO promotion_has_tarif ( id_promotion, id_tarif ) (
    SELECT
        promotion.id_promotion,
        tarifs.id_tarif 
    FROM
        promotion,
        tarifs 
    WHERE
        promotion.`code` LIKE '%APAF%' 
        AND promotion.activer = 1 
    AND tarifs.id_tarif IN ( 44, 45 ) 
    );
    
    INSERT IGNORE INTO promotion_has_categorie ( id_promotion, id_categorie ) (
    SELECT
        promotion.id_promotion,
        categorie_vehicule.id_cat_vehi 
    FROM
        promotion,
        categorie_vehicule 
    WHERE
        promotion.`code` LIKE '%APAF%' 
        AND promotion.activer = 1 
    AND categorie_vehicule.activer = 1 
    );
    
    INSERT IGNORE INTO promotion_has_societes_depart ( id_promotion, id_societe ) (
    SELECT
        promotion.id_promotion,
        societes.id_societe 
    FROM
        promotion,
        societes 
    WHERE
        promotion.`code` LIKE '%APAF%' 
        AND promotion.activer = 1 
        AND societes.activer = 1 
    AND societes.id_societe_mere IS NOT NULL 
    );
    
    INSERT IGNORE INTO promotion_has_societes_retour ( id_promotion, id_societe ) (
    SELECT
        promotion.id_promotion,
        societes.id_societe 
    FROM
        promotion,
        societes 
    WHERE
        promotion.`code` LIKE '%APAF%' 
        AND promotion.activer = 1 
        AND societes.activer = 1 
    AND societes.id_societe_mere IS NOT NULL 
    );