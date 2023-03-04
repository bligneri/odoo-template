#!/usr/bin/env bash

# Copy the /tmp/odoo files into the mount
cp -r /tmp/odoo odoo

# Launch the service
cd /app/odoo
./odoo-bin
