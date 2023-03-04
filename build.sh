#!/usr/bin/env bash

# get the odoo version to clone
ODOOVERSION=$(cat odoo_version)

#clone the repo
git clone https://www.github.com/odoo/odoo --depth 1 --branch ODOOVERSION /odoo/

# Install dependencies

