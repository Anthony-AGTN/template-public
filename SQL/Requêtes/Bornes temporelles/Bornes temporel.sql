#Donne le premier jour du MOIS heure 00:00:00
DATE_FORMAT(NOW(), '%Y-%m-01 00:00:00')

#Donne le premier jour du M-1 heure 00:00:00
DATE_FORMAT(NOW() - INTERVAL 1 MONTH, '%Y-%m-01 00:00:00')

#Donne le dernier jour du M-1 heure 23:59:59
DATE_FORMAT(LAST_DAY(NOW() - INTERVAL 1 MONTH), '%Y-%m-%d 23:59:59')

#Donne le lundi de la semaine précédente heure 00:00:00
DATE_FORMAT(NOW() - INTERVAL DAYOFWEEK(NOW()) - 2 DAY - INTERVAL 1 WEEK, '%Y-%m-%d 00:00:00')

#Donne le dimanche de la semaine précédente heure 23:59:59
DATE_FORMAT(NOW() - INTERVAL DAYOFWEEK(NOW()) - 2 DAY - INTERVAL 1 DAY, '%Y-%m-%d 23:59:59')