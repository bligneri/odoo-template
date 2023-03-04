#!/usr/bin/env bash

ODOOVERSION=$(cat odoo_version)

git clone https://www.github.com/odoo/odoo --depth 1 --branch ODOOVERSION .

