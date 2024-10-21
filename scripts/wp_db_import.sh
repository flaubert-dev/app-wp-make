#!/bin/bash

cd ..
cat ./dump.sql | docker exec -i mariadb mariadb -u root --password=root test
