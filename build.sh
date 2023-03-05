#!/usr/bin/env bash

# get the odoo version to clone
ODOOVERSION=$(cat odoo_version)

PATH_ODOO="/tmp/"

# Update to the latest pip
python3.11 -m pip install --upgrade pip

# DEBUG
#Delete the current ./odoo
#rm -rf ./odoo
# END DEBUG

#clone the repo
git clone https://www.github.com/odoo/odoo --depth 1 --branch $ODOOVERSION $PATH_ODOO/odoo

# Install dependencies
cd $PATH_ODOO/odoo
pip install ./

# Debug our build process: is there something in /tmp ?
echo `ls -la /tmp/odoo` > /tmp/files
echo `ls -la /tmp/odoo/odoo` >> /tmp/files
