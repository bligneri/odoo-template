#!/usr/bin/env bash

# get the odoo version to clone
ODOOVERSION=$(cat odoo_version)

PATH_ODOO="./odoo2"

#Delete the current ./odoo
rm -rf ./odoo

#clone the repo
git clone https://www.github.com/odoo/odoo --depth 1 --branch $ODOOVERSION $PATH_ODOO

# Install dependencies
cd $PATH_ODOO
pip install ./

# Move the files to /tmp
cd
mv $PATH_ODOO /tmp
ls -la /tmp/odoo2
