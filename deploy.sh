#!/usr/bin/env bash

# Copy the /tmp/odoo files into the mount
cp -r /tmp/odoo /app/odoo

cp /tmp/files /app/dir_content.txt

# Launch the service
cd /app/odoo/odoo
./odoo-bin
