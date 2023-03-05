#!/usr/bin/env bash

# get the odoo version to clone
ODOOVERSION=$(cat odoo_version)

PATH_ODOO="/tmp"

# Update to the latest pip
python3.11 -m pip install --upgrade pip

# Note: the upgrade works but the updated version of pip is not used
# => most cerainly a PATH issue

#clone the repo
# Note: Should be smarter and only download the code if not there for the $ODOOVERSION
# If the code is already thre, no need to change it
git clone https://www.github.com/odoo/odoo --depth 1 --branch $ODOOVERSION $PATH_ODOO/odoo

# Install dependencies
cd $PATH_ODOO/odoo
pip install ./

# We now need to copy the add-ons to a directory that will persist after the build
cp -r $PATH_ODOO/odoo/odoo/addons/ /app/odoo/addons/
