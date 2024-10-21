#!/bin/bash

cd ..
cd public/wp-content/themes/
composer create-project roots/sage wp-sage 10.8.2
sudo chmod 777 wp-sage && sudo chown -R $(whoami):www-data wp-sage
cd ..
mkdir -p cache/acorn/framework/views
sudo chmod 777 cache && sudo chown -R $(whoami):www-data cache
cd themes/wp-sage/
composer require roots/acorn:4.3.0
yarn
