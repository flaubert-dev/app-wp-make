#!/bin/bash

# Verifica se o usuário é root
if [ "$EUID" -ne 0 ]; then
  echo "Por favor, execute este script como root / sudo"
  exit
fi

# Cria um backup do arquivo sudoers
cp /etc/sudoers /etc/sudoers.bak
echo "Backup do arquivo sudoers criado em /etc/sudoers.bak"

# Adiciona 'NOPASSWD' ao arquivo sudoers
if grep -q "%sudo.*NOPASSWD" /etc/sudoers; then
  echo "NOPASSWD já está configurado. Tudo certo."
else
  echo "Configurando NOPASSWD..."
  echo "%sudo ALL=(ALL:ALL) NOPASSWD: ALL" >> /etc/sudoers
  echo "Configuração concluída."
fi
