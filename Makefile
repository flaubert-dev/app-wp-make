SHELL := /bin/bash

ubuntu:
	@sudo -S apt update && sudo -S apt upgrade -y
	@sudo -S apt install software-properties-common ca-certificates lsb-release apt-transport-https -y
	@echo LC_ALL=C.UTF-8 sudo -S add-apt-repository ppa:ondrej/php
	@sudo -S apt update -y
	@sudo -S apt install -y php8.1 php8.1-mbstring php8.1-curl php8.1-xml php8.1-simplexml
	@php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');"
	@php -r "if (hash_file('sha384', 'composer-setup.php') === 'dac665fdc30fdd8ec78b38b9800061b4150413ff2e3b6f88543c636f7cd84f6db9189d43a81e5503cda447da73c7e5b6') { echo 'Installer verified'; } else { echo 'Installer corrupt'; unlink('composer-setup.php'); } echo PHP_EOL;"
	@php composer-setup.php --version=2.2.6
	@php -r "unlink('composer-setup.php');"
	@sudo -S mv composer.phar /usr/local/bin/composer
	@sudo -S apt install -y apparmor apparmor-utils docker.io docker-buildx docker-compose
	@sudo -S usermod -aG docker $$USER
	@composer global require "squizlabs/php_codesniffer=3.7.1"
	@sudo -S apt install -y nano
	@wget -qO- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.3/install.sh | bash
	@. ~/.nvm/nvm.sh && nvm install 20.11.1
	@. ~/.nvm/nvm.sh && npm install -g gulp-cli yarn
	@sudo -S apt purge git -y && sudo -S apt remove git -y
	@sudo -S apt update && sudo -S apt install git -y
	@git config --global init.defaultBranch main
	@git config --global core.editor "code --wait"
	@echo -e "\n" | ssh-keygen
	@echo "--> As configurações essenciais foram realizadas com sucesso! Por favor, agora feche o terminal!"

wp:	iniciar aguardar
	@docker-compose run wpcli core install --url=localhost:8000 --title="DEV" --admin_user=dev --admin_password=123 --admin_email=dev@exemplo.com
	@sudo -S chmod -R 777 ~/app-wp-make/public 
	@sudo chown -R $$USER:www-data ~/app-wp-make/public
	@docker-compose run wpcli plugin install advanced-custom-fields --activate
	@cd ~/app-wp-make/public/wp-content/themes/ && composer create-project roots/sage wp-sage 10.6.0
	@sudo -S chmod -R 777 ~/app-wp-make/public/wp-content/themes/wp-sage
	@cd ~/app-wp-make/public/wp-content/themes/wp-sage/ && composer require roots/acorn:3.3.1 && yarn
	@docker-compose run wpcli theme activate wp-sage
	@cd ~/app-wp-make/public/wp-content/themes/wp-sage/ && docker-compose run wpcli acorn acorn:init
	@sudo -S chmod -R 777 ~/app-wp-make/public/wp-content/themes/wp-sage/config 
	@cd ~/app-wp-make/public/wp-content/themes/wp-sage/ && yarn build
	@cd ~/app-wp-make/public/wp-content/themes/wp-sage/ && composer require stoutlogic/acf-builder && docker-compose run wpcli acorn optimize:clear
	@cd ~/app-wp-make/public/wp-content/themes/wp-sage/ && composer require log1x/acf-composer && docker-compose run wpcli acorn optimize:clear
	@sudo -S chmod -R 777 ~/app-wp-make/public/wp-content/cache
	@cd ~/app-wp-make/public/wp-content/themes/wp-sage/ && docker-compose run wpcli acorn package:discover
	@cd ~/app-wp-make/public/wp-content/themes/wp-sage/ && docker-compose run wpcli acorn acf:field ExampleField
	@sudo -S chmod -R 777 ~/app-wp-make/public/wp-content/themes/wp-sage/app
	@mkdir ~/app-wp-make/public/wp-content/themes/wp-sage/acf-json
	@sudo -S chmod -R 777 ~/app-wp-make/public/wp-content/themes/wp-sage/acf-json
	@cd ~/app-wp-make/public/wp-content/themes/ && git clone https://github.com/flaubert-dev/wp-api-starter-theme.git
	@sudo -S chmod -R 777 ~/app-wp-make/public/wp-content/themes/wp-api-starter-theme
	@cd ~/app-wp-make/public/wp-content/themes/wp-api-starter-theme && rm -fr .git
	@cd ~/app-wp-make/public/wp-content/themes/wp-api-starter-theme && rm -f tailwindcss.exe
	@cd ~/app-wp-make/public/wp-content/themes/wp-api-starter-theme && yarn cache clean && yarn install && npx update-browserslist-db@latest
	@cd ~/app-wp-make/public/wp-content/themes/wp-api-starter-theme && wget https://github.com/tailwindlabs/tailwindcss/releases/download/v3.3.3/tailwindcss-linux-x64
	@cd ~/app-wp-make/public/wp-content/themes/wp-api-starter-theme && mv tailwindcss-linux-x64 tailwindcss
	@docker-compose run wpcli theme install really-simple
	@docker-compose run wpcli theme activate really-simple
	@echo "--> Boa!! Você instalou com sucesso o App WP Make!"
	@echo "--> Para usar o App WP Make com facilidade, confira: https://github.com/flaubert-dev/app-wp-make"

iniciar:
	@sudo systemctl start docker && docker-compose up -d

reiniciar:
	docker-compose down && docker-compose up -d

desligar:
	docker-compose down

# INSTALE o Docker e o Docker Compose antes de executar este comando!
# Atenção!! Este comando vai remover todos os containers, volumes, wordpress e o banco de dados também!
# Faça um backup primeiro antes de executar este comando!
desinstalar:
	@sudo systemctl start docker && docker-compose down --volumes --rmi all
	@sudo chmod -R 777 ~/app-wp-make/public
	rm -fr ~/app-wp-make/public
	@sudo chmod -R 777 ~/app-wp-make/db_data
	rm -fr ~/app-wp-make/db_data

espaco:
	@sudo systemctl start docker && docker system df

chave:
	@cat ~/.ssh/id_rsa.pub

zsh:
	@sudo -S apt install -y zsh
	@echo "--> ATENÇÃO: Quando aparecer no terminal 'app-wp-make' no final das configurações execute o comando: exit e só depois de executar feche o terminal!"
	@for i in $$(seq 10 -1 1); do \
		echo -n "$$i "; \
		sleep 1; \
	done
	@chsh -s $$(which zsh)
	@sh -c "$$(wget -O- https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
	@cp ~/.zshrc ~/.zshrc.orig
	@sed -i 's/ZSH_THEME=".*"/ZSH_THEME="eastwood"/' ~/.zshrc
	@sed -i 's/plugins=(git)/plugins=(git composer nvm node gulp yarn)/' ~/.zshrc
	@sed -i '1i alias wp="docker-compose run wpcli"' ~/.bashrc
	@sed -i '1i alias wp="docker-compose run wpcli"' ~/.zshrc

aguardar:
	@echo "--> ATENÇÃO: O Docker está realizando as configurações necessárias. Aguarde apenas 1 minuto e 30 segundos para que o WordPress inicie a instalação automaticamente! Por favor, não saia do terminal e/ou não desligue o computador!"
	@for i in $$(seq 90 -1 1); do \
		echo -n "$$i "; \
		sleep 1; \
	done
