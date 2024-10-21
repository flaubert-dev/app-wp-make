#!/bin/bash

sudo cp wp-cli-allow-root.sh /usr/local/bin
cd ~
wget -O wp-cli.phar https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
chmod +x wp-cli.phar
mv wp-cli.phar wp
sudo mv wp /usr/local/bin
