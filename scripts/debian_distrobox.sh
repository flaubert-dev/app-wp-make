#!/bin/bash

# Instalar o Distrobox
wget -qO- https://raw.githubusercontent.com/89luca89/distrobox/main/install | sh -s -- --prefix ~/.local

# Instalar o container do Debian 12 via Distrobox
distrobox-create --image docker.io/library/debian:12 --name debian-12 --additional-packages "git locales-all"

# Entrar no container do Debian 12
distrobox enter debian-12
