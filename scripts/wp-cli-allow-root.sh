#!/bin/bash

docker exec -it wordpress wp "$@" --allow-root
