#!/usr/bin/env bash

# get the odoo version to clone
ODOOVERSION=$(cat odoo_version)

# When developing locally
# Just `touch local_dev`
# And you can test the build script locally (odoo will be in ./odoo
# On Platform.sh containers, odoo will be on /app/odoo/

FILE=local_dev
if [ -f "$FILE" ]; then
    PATH_ODOO="."
else
    PATH_ODOO="/app"
fi

PATH_ODOO="${PATH_ODOO}/odoo"

#clone the repo
git clone https://www.github.com/odoo/odoo --depth 1 --branch $ODOOVERSION $PATH_ODOO

# Install dependencies
cd $PATH_ODOO
pip install ./
