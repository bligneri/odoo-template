#!/usr/bin/env bash

# Recover the plaftorm.sh variables required to install odoo 
DB_HOST=`echo $PLATFORM_RELATIONSHIPS | base64 --decode | jq -r ".database[0].host"`
DB_USER=`echo $PLATFORM_RELATIONSHIPS | base64 --decode | jq -r ".database[0].username"`
DB_PASSWORD=`echo $PLATFORM_RELATIONSHIPS | base64 --decode | jq -r ".database[0].password"`
DB_NAME=`echo $PLATFORM_RELATIONSHIPS | base64 --decode | jq -r ".database[0].path"`


# We are launching Odoo using the platform.sh variables for connexion and port
cd ./src/odoo/
python3.11 ./odoo-bin --db_host=$DB_HOST --db_user=$DB_USER --db_password="$DB_PASSWORD" -d $DB_NAME --http-port=$PORT --syslog 
