#Pour une redirection de port voir exemples ci-dessous

#netsh routing ip nat add portmapping (nom de la carte reseau) (tcp ou udp) 0.0.0.0 (port entrant)	 (IP de destination coté privé) (port sortant)

#Exemple:

#netsh routing ip nat add portmapping WAN tcp 0.0.0.0 51000	 172.16.0.10 51000

netsh routing ip nat add portmapping NAT tcp 0.0.0.0 60200	 10.7.4.2 60201