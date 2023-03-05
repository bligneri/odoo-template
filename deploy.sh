#!/usr/bin/env bash
APP_DIR=`pwd`

# Copy the add_ons in their new home
# Clean the addons directory and copy from the source
# Rsync the whole tree
rsync -az $PLATFORM_CACHE_DIR/odoo-src ./odoo
#rm -rf "$APP_DIR/odoo/addons" && cp -r "$APP_DIR/odoo-src/" "$APP_DIR/odoo/"
#ADDON_PATH=$APP_DIR/odoo/addons

# Recover the plaftorm.sh variables required to install odoo 
DB_HOST=`echo $PLATFORM_RELATIONSHIPS | base64 --decode | jq -r ".database[0].host"`
DB_USER=`echo $PLATFORM_RELATIONSHIPS | base64 --decode | jq -r ".database[0].username"`
DB_PASSWORD=`echo $PLATFORM_RELATIONSHIPS | base64 --decode | jq -r ".database[0].password"`
DB_NAME=`echo $PLATFORM_RELATIONSHIPS | base64 --decode | jq -r ".database[0].path"`

# Initialize the server and stop
# We want to use WSGI to access it
cd ./odoo/
./odoo-bin --init --addons-path=$ADDON_PATH --db_host=$DB_HOST --db_user=$DB_USER --db_password="$DB_PASSWORD" -d $DB_NAME --stop-after-init
