#!/bin/bash

# Ativar debugs no wp-config.php
docker exec -it wordpress wp config set WP_DEBUG true
docker exec -it wordpress wp config set WP_DEBUG_LOG true
docker exec -it wordpress wp config set WP_DEBUG_DISPLAY true
