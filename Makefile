SHELL 				:= /bin/bash
BLUE  				:= \033[1;36m
YELLOW 				:= \033[1;33m
LIGHT_GREEN 	:= \033[1;32m
RESET 				:= \033[0m

# Begin / init
allow_scripts:
	@cd scripts && chmod +x ./allow_scripts.sh && ./allow_scripts.sh

start: allow_scripts
	@cd scripts && ./start.sh

prepare: allow_scripts
	@cd scripts && ./prepare.sh

dir_public: allow_scripts
	@cd scripts && sudo ./dir_public.sh

sudo_without_password: allow_scripts
	@cd scripts && sudo ./sudo_without_password.sh

# Alias: Bash
alias_bash_copy: allow_scripts
	@cd scripts && ./alias_bash_copy.sh

alias_bash_wp_cli: allow_scripts
	@cd scripts && ./alias_bash_wp_cli.sh

# Alias: Zsh
alias_zsh_copy: allow_scripts
	@cd scripts && ./alias_zsh_copy.sh

alias_zsh_wp_cli: allow_scripts
	@cd scripts && ./alias_zsh_wp_cli.sh

# (Em construção / testes)
# ChromeOS Flex: Docker Debian 12
# chrome-os-flex-docker-debian: allow_scripts debian_docker

# (Em construção / testes)
# ChromeOS Flex: Debian 12
# chrome-os-flex-debian: allow_scripts start nvm_install nvm_node npm_yarn

# (Em construção / testes)
# Endless OS: Distrobox Debian 12
# endless-os-distrobox-debian: allow_scripts debian_distrobox
# 	@sudo ln -s /usr/bin/distrobox-host-exec /usr/local/bin/podman
# 	@sudo apt update && sudo apt install podman-docker docker-compose -y

# (Em construção / testes)
# Endless OS: Debian 12
# endless-os-debian: allow_scripts start

# (Em construção / testes)
# Endless OS: Distrobox Ubuntu 22.04
# endless-os-distrobox-ubuntu: allow_scripts ubuntu_distrobox
# 	@sudo ln -s /usr/bin/distrobox-host-exec /usr/local/bin/podman
# 	@sudo apt update && sudo apt install podman-docker docker-compose -y

# (Em construção / testes)
# Endless OS: Ubuntu 22.04
# endless-os-ubuntu: allow_scripts start

# (Em construção / testes)
# MX Linux 23: Debian 12
# mx-linux-debian: allow_scripts start nvm_install nvm_node npm_yarn

# Windows WSL 2: Docker Debian 12
windows-wsl-2-docker-debian: allow_scripts sudo_without_password debian_docker

# Windows WSL 2: Debian 12
windows-wsl-2-debian: allow_scripts start sudo_without_password

# Windows WSL 2: Docker Ubuntu 22.04
windows-wsl-2-docker-ubuntu: allow_scripts sudo_without_password ubuntu_docker

# Windows WSL 2: Ubuntu 22.04
windows-wsl-2-ubuntu: allow_scripts start sudo_without_password

# Prepara o ambiente para o WordPress: Imagens, PHP, WP-CLI e Composer
wp-prepare: allow_scripts wp_cli_install alias_bash_copy alias_bash_wp_cli prepare build php_install composer_install dir_public waiting
	@echo "$(LIGHT_GREEN)-->$(RESET) Boa!! Agora o ambiente de desenvolvimento local está preparado para iniciar a instalação do $(LIGHT_GREEN)WordPress$(RESET)!"

# Docker / Docker Compose
build:
	docker-compose up -d --build

up:
	docker-compose up -d

restart:
	docker-compose down && docker-compose up -d

down:
	docker-compose down

system-df:
	@docker system df

# (Em construção / testes)
# Atenção!! Este comando vai remover TODOS os containers, images, volumes, db e o wordpress também!
# Faça um BACKUP primeiro antes de executar este comando!
# uninstall: up waiting wp_db_export
# 	@docker-compose down --volumes --rmi all
# 	@sudo chmod -R 777 public
# 	@sudo rm -fr public
# 	@sudo chmod -R 777 db_data
# 	@sudo rm -fr db_data
# 	@echo "$(LIGHT_GREEN)-->$(RESET) Todos os containers, images, volumes, banco de dados, wordpress removidos com $(LIGHT_GREEN)sucesso$(RESET)!"
# 	@echo "$(LIGHT_GREEN)-->$(RESET) Use o App WP Make com facilidade, confira: https://github.com/flaubert-dev/app-wp-make"

# Debian
# debian_distrobox:
# 	@cd scripts && ./debian_distrobox.sh

debian_docker:
	@cd scripts && ./debian_docker.sh

# Ubuntu
# ubuntu_distrobox:
# 	@cd scripts && ./ubuntu_distrobox.sh

ubuntu_docker:
	@cd scripts && ./ubuntu_docker.sh

# PHP
php_install:
	@cd scripts && ./php_install.sh

# Composer
composer_install:
	@cd scripts && ./composer_install.sh

# NVM: Node / Yarn (Debian e Ubuntu)
nvm_node_yarn_distro:
	@cd scripts && ./nvm_install.sh
	@cd scripts && ./nvm_node.sh
	@cd scripts && ./npm_yarn.sh

# NVM: Node / Yarn (WSL: Debian e Ubuntu)
nvm_node_yarn_wsl:
	@wget -qO- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.3/install.sh | bash
	@. ~/.nvm/nvm.sh && nvm install 20.11.1
	@. ~/.nvm/nvm.sh && npm install -g yarn

# NPM: Gulp CLI
npm_gulp_cli:
	@cd scripts && ./npm_gulp_cli.sh

# (Em construção / testes)
# Ngrok
# ngrok_install:
# 	@cd scripts && ./ngrok_install.sh

# ngrok_config:
# 	@cd scripts && ./ngrok_config.sh

# (Em construção / testes)
# Git: SSH Key
# git_ssh_key:
# 	@cd scripts && ./git_ssh_key.sh

# git_ssh_view:
# 	@cd scripts && ./git_ssh_view.sh

# (Em construção / testes)
# Zsh: Oh My Zsh / Plugins
# zsh_install:
# 	@cd scripts && ./zsh_install.sh

# oh_my_zsh: alias_zsh_copy
# 	@cd scripts && ./oh_my_zsh.sh

# zsh_plugins:
# 	@cd scripts && ./zsh_plugins.sh

# WordPress: Instalar o WP-CLI
wp_cli_install:
	@cd scripts && ./wp_cli_install.sh

# WordPress: DB Export
wp_db_export:
	@cd scripts && ./wp_db_export.sh

# WordPress: DB Import
wp_db_import:
	@cd scripts && ./wp_db_import.sh

# WordPress: Sage
wp_sage_install:
	@cd scripts && ./wp_sage_install.sh

wp_sage_build:
	@cd scripts && ./wp_sage_build.sh

# (Em construção / testes)
# WordPress: Sage ACF
# wp_sage_acf_composer:
# 	@cd scripts && ./wp_sage_acf_composer.sh

waiting:
	@echo "$(YELLOW)--> ATENÇÃO$(RESET): O Docker está realizando as configurações necessárias no MariaDB e phpMyAdmin. Aguarde apenas 60 segundos! Por favor, não desligue o computador e nem feche o terminal para não corromper os containers!"
	@for i in $$(seq 60 -1 1); do \
		echo -n "$$i "; \
		sleep 1; \
	done
