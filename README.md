# Troubleshooting (Deprecated = résolu)

- Pour l'instant le container web-apache-mysql est en restarting, probablement à cause de mysql et des problème de certificats

- [DEPRECATED] Sur la machine qui hébergera la container ZAbbix server, créer au préalable un network docker comme suit : `docker network create --subnet 172.20.0.0/16 --ip-range 172.20.240.0/20 zabbix-net`|

- [DEPRECATED] Après l'erreur **Invalid index** il faut re-faire un `sudo terraform plan` (sudo pcq réseau du campus) puis un `sudo terraform apply`. -> Parce que l'adresse IP n'est pas encore stocké dans la variable la première fois.

- Pour éviter les erreurs, récupérer les adresses IP "à la main" avant et les renseigner dans l'inventory avant de lancer les playbooks