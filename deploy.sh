#!/usr/bin/env bash
APP_DIR=`pwd`

# Copy the add_ons in their new home
# Clean the addons directory and copy from the source
# Rsync the whole tree into the r/w section via rsync
rsync -az ./src/* ./odoo/

#rm -rf "$APP_DIR/odoo/addons" && cp -r "$APP_DIR/odoo-src/" "$APP_DIR/odoo/"
#ADDON_PATH=$APP_DIR/odoo/addons

# Recover the plaftorm.sh variables required to install odoo 
DB_HOST=`echo $PLATFORM_RELATIONSHIPS | base64 --decode | jq -r ".database[0].host"`
DB_USER=`echo $PLATFORM_RELATIONSHIPS | base64 --decode | jq -r ".database[0].username"`
DB_PASSWORD=`echo $PLATFORM_RELATIONSHIPS | base64 --decode | jq -r ".database[0].password"`
DB_NAME=`echo $PLATFORM_RELATIONSHIPS | base64 --decode | jq -r ".database[0].path"`


# When the Odoo has run once -> this directory will exist
# Do nothint in this case: server is ready to run / nothing to deploy
# To redeploy: `platform ssh` and then `rm -rf ./local/share/Odoo`
# You also need to drop your database (or it will cause errors)
DIRECTORY="./local/share/Odoo"

if [ ! -d "$DIRECTORY"]; then
	cd ./src/odoo/
	# Initilize te
	python3.11 ./odoo-bin -i base --db_host=$DB_HOST --db_user=$DB_USER --db_password="$DB_PASSWORD" -d $DB_NAME --http-port=$PORT --stop-after-init
fi
