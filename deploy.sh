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

# Initialize the server and stop
# We want to use WSGI to access it
cd ./odoo/odoo/

# When the DB is alredy initialized: log to syslog
python3.11 ./odoo-bin --addons-path=$ADDON_PATH --db_host=$DB_HOST --db_user=$DB_USER --db_password="$DB_PASSWORD" -d $DB_NAME --syslog


# To initialized the DB
#python3.11 ./odoo-bin -i base --addons-path=$ADDON_PATH --db_host=$DB_HOST --db_user=$DB_USER --db_password="$DB_PASSWORD" -d $DB_NAME
#web@app.0:~/odoo/odoo$ python3.11 odoo-bin -i base --data-dir=/app/odoo/data/ --db_host=$DB_HOST --db_user=$DB_USER --db_password="$DB_PASSWORD" -d $DB_NAME

