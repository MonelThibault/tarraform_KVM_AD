# Troubleshooting

- Après l'erreur **Invalid index** il faut re-faire un `sudo terraform plan` (sudo pcq réseau du campus) puis un `sudo terraform apply`. -> Parce que l'adresse IP n'est pas encore stocké dans la variable la première fois.

- Pour éviter les erreurs, récupérer les adresses IP "à la main" avant et les renseigner dans l'inventory avant de lancer ls playbooks