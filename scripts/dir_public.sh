#!/bin/bash

cd ..
sudo chmod -R 777 public
sudo chown -R $(whoami):www-data public
