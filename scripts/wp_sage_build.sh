#!/bin/bash

cd ..
cd public/wp-content/themes/wp-sage/
sudo chmod 777 config && sudo chown -R $(whoami):www-data config

# Permissões no acorn: parte 1
cd ../..
cd cache
sudo chmod 777 acorn
sudo chown -R $(whoami):www-data acorn

# Permissões no acorn: parte 2
cd acorn
sudo chmod 777 framework logs
sudo chown -R $(whoami):www-data framework logs

# Permissões no acorn: parte 3
cd framework
sudo chmod 777 *
sudo chown -R $(whoami):www-data *

# Construir Sage
cd ../../..
cd themes/wp-sage/
yarn build
