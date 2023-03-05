#!/usr/bin/env bash

# what was there?
cat /tmp/files

# Can we copy the content of the build to /app/odoo ?
cp -r /tmp/odoo /app/odoo

# can we copy a file?
cp /tmp/files /app/dir_content.txt

# Can we launch odoo?
cd /app/odoo/odoo
./odoo-bin
