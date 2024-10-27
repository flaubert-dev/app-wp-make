# App WP Make

Um passo a passo para ajudar os Devs na criação de um ambiente de desenvolvimento local. Este repositório exige um amplo conhecimento em Linux, Docker e WordPress para conseguir desfrutar do App WP Make com total segurança! Para facilitar, é só seguir o passo a passo:

Passo 1. [Instalação](#passo-1-instalação) <br>
Passo 2. [Preparar o ambiente de desenvolvimento local](#passo-2-preparar-o-ambiente-de-desenvolvimento-local) <br>
Passo 3. [Instalar o WordPress](#passo-3-instalar-o-wordpress) <br>
Passo 4. [Entrar no app](#passo-4-login-credenciais) <br>
Passo 5. [Links de acesso](#passo-5-acessar-o-app)

<hr>

## Passo 1. Instalação

> 1. Instalar git e make

```bash
sudo apt update && sudo apt install git make -y
```

> 2. Baixar o App WP Make

```bash
cd ~ && git clone https://github.com/flaubert-dev/app-wp-make.git
```

> 3. Entre no diretório

```bash
cd ~/app-wp-make && rm -fr .git
```

## Passo 2. Preparar o ambiente de desenvolvimento local

### WSL 2: Ubuntu 22.04

Se já instalou no Windows o WSL 2 e o Ubuntu 22.04 poderá executar estes comandos no terminal da distribuição:

```bash
cd ~/app-wp-make && make windows-wsl-2-docker-ubuntu
```

```bash
cd ~/app-wp-make && make windows-wsl-2-ubuntu
```

```bash
cd ~/app-wp-make && make wp-prepare && source ~/.bashrc
```

```bash
cd ~/app-wp-make && wp config set FS_METHOD direct
```

## Passo 3. Instalar o WordPress

```bash
cd ~/app-wp-make && wp core install --url=localhost --title="Bem-vindo ao WordPress" --admin_user=dev --admin_password=123 --admin_email=dev@exemplo.com
```

## Passo 4. Login (credenciais)

- Painel ADM: http://localhost/wp-admin/
- Username: dev
- Password: 123

## Passo 5. Acessar o App

- App: http://localhost/
- phpMyAdmin: http://localhost:10777/
- REST API: http://localhost/wp-json/wp/v2/posts/

## Buildar, levantar, reiniciar, descer os containers

```bash
cd ~/app-wp-make && make build
```

```bash
cd ~/app-wp-make && make up
```

```bash
cd ~/app-wp-make && make restart
```

```bash
cd ~/app-wp-make && make down
```

## Verificar a quantidade de espaço utilizado

```bash
cd ~/app-wp-make && make system-df
```

## 100% opcional

### Instalar o Sage Starter Theme 10

```bash
cd ~/app-wp-make && make nvm_node_yarn_wsl && source ~/.bashrc
```

```bash
make wp_sage_install
```

```bash
wp theme activate wp-sage && wp acorn acorn:init
```

```bash
make wp_sage_build
```

### Instalar o WordPress Multisite

```bash
cd ~/app-wp-make && wp core multisite-install --url=localhost --title="Bem-vindo ao WordPress" --admin_user="dev" --admin_password="123" --admin_email="dev@exemplo.com"
```
