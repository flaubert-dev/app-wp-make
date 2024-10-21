#!/bin/bash

# Instalar o Distrobox
wget -qO- https://raw.githubusercontent.com/89luca89/distrobox/main/install | sh -s -- --prefix ~/.local

# Instalar o container do Ubuntu 22.04 LTS via Distrobox
distrobox-create --image docker.io/library/ubuntu:22.04 --name ubuntu-22.04 --additional-packages "git locales-all"

# Entrar no container do Ubuntu 22.04 LTS
distrobox enter ubuntu-22.04
