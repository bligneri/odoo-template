#!/usr/bin/env bash

# get the odoo version to clone
ODOOVERSION=$(cat odoo_version)

PATH_ODOO="./odoo2"

# DEBUG
#Delete the current ./odoo
#rm -rf ./odoo
# END DEBUG

#clone the repo
git clone https://www.github.com/odoo/odoo --depth 1 --branch $ODOOVERSION $PATH_ODOO

# Install dependencies
cd $PATH_ODOO
pip install ./

# Move the files to /tmp
cd
mv $PATH_ODOO /tmp/odoo2
echo `ls /tmp/odoo2` > /tmp/files
