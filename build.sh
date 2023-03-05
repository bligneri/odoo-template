#!/usr/bin/env bash -eu

# get the odoo version to clone
ODOOVERSION=$(cat odoo_version)

# Update to the latest pip
python3.11 -m pip install --upgrade pip

# Note: the upgrade works but the updated version of pip is not used
# => most cerainly a PATH issue

#clone the repo
# Note: Should be smarter and only download the code if not there for the $ODOOVERSION
# If the code is already thre, no need to change it
# Using the PLATFORM.sh cache

git clone https://www.github.com/odoo/odoo --depth 1 --branch $ODOOVERSION $PLATFORM_CACHE_DIR/odoo

# Install dependencies 
cd $PLATFORM_CACHE_DIR/odoo && pip install ./

#Copy into the src accessible directory
rsync -az --exclude=.git $PLATFORM_CACHE_DIR/$APP_NAME/* $PLATFORM_APP_DIR/src/

# Install the server
pip install uwsgi
