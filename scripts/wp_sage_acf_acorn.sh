#!/bin/bash

# Navegar para o diretório do Sage
cd /var/www/html/wp-content/themes/wp-sage/

# Criação do primeiro field
wp --allow-root acorn optimize:clear
wp --allow-root acorn package:discover
wp --allow-root acorn acf:field ExampleField
