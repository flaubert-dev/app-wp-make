# App WP Make

O App WP Make fornece uma ajuda na criação de ambiente de desenvolvimento local para Devs especializados em WordPress. Por exemplo, se você tem o WSL 2 com o Ubuntu 22.04 poderá criar um ambiente de desenvolvimento em alguns minutos usando o App WP Make. Porém, este repositório ainda está em fase de testes! No momento (por enquanto), de fato um amplo / vasto conhecimento é realmente necessário para conseguir usar / usufruir / desfrutar do App WP Make com total segurança!

## Passo 1. Instalar o App WP Make

- WSL 2: Ubuntu 22.04

```bash
sudo apt update && sudo apt install git make -y
```

```bash
cd ~ && git clone https://github.com/flaubert-dev/app-wp-make.git
```

```bash
cd ~/app-wp-make && rm -fr .git
```

## Passo 2. Preparar o ambiente de desenvolvimento local

- WSL 2: Ubuntu 22.04

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

## Login (credenciais)

- Painel ADM: http://localhost/wp-admin/
- Username: dev
- Password: 123

## Acessar o App

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

## Opcional

### Instalar o Sage Starter Theme 10

- WSL 2: Ubuntu 22.04

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

- WSL 2: Ubuntu 22.04

```bash
cd ~/app-wp-make && wp core multisite-install --url=localhost --title="Bem-vindo ao WordPress" --admin_user="dev" --admin_password="123" --admin_email="dev@exemplo.com"
```
