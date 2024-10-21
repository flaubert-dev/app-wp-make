#!/bin/bash

# Instalar o Docker
sudo apt update && sudo apt install -y apparmor apparmor-utils docker.io docker-compose

# Iniciar o Docker
sudo usermod -aG docker $USER && sudo update-rc.d docker defaults && sudo service docker start

# Alterna para a conta de usuário especificada
# Referencia: https://medium.com/@agilemaster3/understanding-the-difference-su-user-vs-su-user-in-linux-bc502b4cbaf2
su - $USER
