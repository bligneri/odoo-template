#!/usr/bin/env bash

# get the odoo version to clone
ODOOVERSION=$(cat odoo_version)

PATH_ODOO="./odoo"

#clone the repo
git clone https://www.github.com/odoo/odoo --depth 1 --branch $ODOOVERSION $PATH_ODOO

# Install dependencies
cd $PATH_ODOO
pip install ./

# Move the files to /tmp
mv $PATH_ODOO /tmp/odoo
