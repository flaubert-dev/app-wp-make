SHELL := /bin/bash

instalacao-parte-1:
	sudo apt update && sudo apt upgrade -y
	sudo apt install apparmor apparmor-utils -y
	sudo apt install docker.io docker-buildx docker-compose -y
	sudo usermod -aG docker $$USER

instalacao-parte-2:
	sudo apt update && sudo apt upgrade -y
	sudo apt install nano -y
	wget -qO- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.3/install.sh | bash
	. ~/.nvm/nvm.sh && nvm install 20.11.1
	. ~/.nvm/nvm.sh && npm install -g gulp-cli yarn
	sudo apt purge git -y && sudo apt remove git -y
	sudo apt update && sudo apt install git -y
	git config --global init.defaultBranch main
	git config --global core.editor "code --wait"
	ssh-keygen

instalacao-parte-3:
	sudo apt install zsh -y
	chsh -s $$(which zsh)
	sh -c "$$(wget -O- https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

instalar: instalacao-parte-1 instalacao-parte-2 instalacao-parte-3

configurar:
	cp ~/.zshrc ~/.zshrc.orig
	sed -i 's/ZSH_THEME=".*"/ZSH_THEME="eastwood"/' ~/.zshrc
	sed -i 's/plugins=(git)/plugins=(git composer nvm node gulp yarn)/' ~/.zshrc
	sed -i '1i alias wp="docker-compose run wpcli"' ~/.bashrc
	sed -i '1i alias wp="docker-compose run wpcli"' ~/.zshrc

ligar: 
	docker-compose up -d

desligar: 
	docker-compose down

reiniciar: 
	docker-compose down && docker-compose up -d

permitir: 
	sudo chmod -R 777 * && sudo chown -R $$USER:www-data *

espaco: 
	docker system df

desinstalar: 
	docker-compose down --volumes --rmi all

ver-ssh-key:
	@cat ~/.ssh/id_rsa.pub

instalar-plugins-zsh:
	git clone https://github.com/zsh-users/zsh-history-substring-search.git ~/.oh-my-zsh/custom/plugins/zsh-history-substring-search
	git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ~/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting
	git clone https://github.com/zsh-users/zsh-autosuggestions.git ~/.oh-my-zsh/custom/plugins/zsh-autosuggestions
	git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf && ~/.fzf/install