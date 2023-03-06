#!/usr/bin/env python
import os
import sys
from platformshconfig import Config
import subprocess

# Create a new Config object to ease reading the Platform.sh environment variables.
# You can alternatively use os.environ yourself.
platformsh = Config()

if not platformsh.is_valid_platform():
    sys.exit("Not in a Platform.sh Environment.")

# The 'database' relationship is generally the name of primary SOL database of an application.
# That's not required, but much of our default automation code assumes it.' \
database = platformsh.credentials ('database')
port = os.getenv("PORT")

# We are launching Odoo using the platform.sh variables for connexion and port

ODOO_BIN = os.path.join(os.environ["HOME"], "src", "odoo-bin")

startCommand=f"python {ODOO_BIN} --db_host={database['host']} --db_user={database['username']} --db_password={database['password']} -d {database['path']} --http-port={port} --syslog"

# Start the Odoo server
process = subprocess.Popen(startCommand, shell=True)
process.wait()  # Wait for the process to complete
