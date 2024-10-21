#!/bin/bash

cd ..
docker exec mariadb mariadb-dump -u root --password=root test > ./dump.sql
