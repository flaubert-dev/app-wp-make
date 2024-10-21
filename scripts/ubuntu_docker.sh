#!/bin/bash

# Instalar o Docker
sudo apt update && sudo apt install -y apparmor apparmor-utils docker.io docker-buildx docker-compose

# Iniciar o Docker
sudo usermod -aG docker $USER && sudo systemctl enable --now docker

# Alterna para a conta de usuário especificada
# Referencia: https://medium.com/@agilemaster3/understanding-the-difference-su-user-vs-su-user-in-linux-bc502b4cbaf2
su - $USER
