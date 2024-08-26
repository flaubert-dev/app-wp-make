# App WP Make

Configure o Ubuntu e/ou Debian de forma simples e instale o WordPress para desenvolvimento, testes ou estudos locais. Este repositório também tem o objetivo de ajudar os Devs na configuração do Linux Ubuntu ou Debian recém instalado via WSL / WSL 2! \o/

## Requisitos / Recomendações

- Ubuntu 22.04 ou Debian: Recém instalado ou formatado.
- WSL com Ubuntu 22.04 ou WSL com Debian: Recém instalado ou formatado.

## Siga este três passos

1. Execute o comando abaixo para iniciar as configurações do Zsh e do Oh My Zsh. ATENÇÃO: Quando aparecer no terminal 'app-wp-make' (ao final das configurações) execute o comando: ```exit``` e só depois de executar ```exit``` é que deverá fechar o terminal!

```bash
sudo apt update && sudo apt upgrade -y && sudo apt install wget git make zip unzip lsb-release -y && cd ~ && git clone https://github.com/flaubert-dev/app-wp-make.git && cd ~/app-wp-make && rm -fr .git && make zsh
```

2. Agora abra o terminal novamente para dar inicio as outras configurações essenciais para que o App funcione corretamente. Por favor, execute este comando:

```zsh
cd ~/app-wp-make && chmod +x instalar.sh && ./instalar.sh
```

3. Após todas as configurações você vai receber um aviso no terminal: "As configurações essenciais foram realizadas com sucesso! Por favor, agora feche o terminal!". Logo depois, abra o terminal novamente e execute o comando abaixo para instalar o App:

```zsh
cd ~/app-wp-make && make wp
```

## App WP Make Portas

- Painel: http://localhost:8000/wp-admin/
- Informar o usuário (username): dev
- Informar a senha (password): 123
- App: http://localhost:8000
- phpMyAdmin: http://localhost:10777

## App WP Make CLI

Iniciar

```zsh
cd ~/app-wp-make && make iniciar
```

Reiniciar

```zsh
cd ~/app-wp-make && make reiniciar
```

Desligar

```zsh
cd ~/app-wp-make && make desligar
```

Desinstalar (Atenção!! Este comando vai remover os containers, volumes, wp e o banco de dados também!)

```zsh
cd ~/app-wp-make && make desinstalar
```

Visualizar a quantidade de espaço utilizado

```zsh
cd ~/app-wp-make && make espaco
```

Visualizar a chave SSH para Github

```zsh
cd ~/app-wp-make && make chave
```
