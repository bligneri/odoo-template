#!/usr/bin/env python
import os
import sys
import datetime
from platformshconfig import Config
import subprocess

TIMESTAMPFILE = os.path.join(os.environ["HOME"], ".local", "DEPLOYED")

print(f"Testing for {TIMESTAMPFILE}")
# If Odoo is already configured, end the deploy script.
if os.path.isfile(TIMESTAMPFILE):
    print(f"{TIMESTAMPFILE} exists: Odoo is installed.")
    print(f"To reinstall, delete this file from the odoo mount.\n")
    print(f"platform ssh and then rm {TIMESTAMPFILE}")
    sys.exit(0)

# Create a new Config object to ease reading the Platform.sh environment variables.
# You can alternatively use os.environ yourself.
config = Config()

if not config.is_valid_platform():
    sys.exit("Not in a Platform.sh Environment.")

# The 'database' relationship is generally the name of primary SOL database of an application.
# That's not required, but much of our default automation code assumes it.' \
database = config.credentials ('database')
port = os.getenv("PORT")

# Define the command to be executed
command = f"python ./odoo-bin -i base --db_host={database['host']} --db_user={database['username']} --db_password={database['password']} -d {database['path']} --http-port={port} --stop-after-init"

# Change to the Odoo directory
ODOO_DIR = os.path.join(os.getcwd(), "src")
os.chdir(ODOO_DIR)

# Initialize the database
print(f"Executing: {command}\n")
process = subprocess.Popen(command, shell=True)
process.wait()  # Wait for the process to complete

##  SUCCESS
## Let's write a file for initialization with a timestamp

# Get current date and time
now = datetime.datetime.now()

# Format the date and time as a string
timestamp = now.strftime("%Y-%m-%d %H:%M:%S")

# Create the file and write the message with timestamp
with open(TIMESTAMPFILE, 'w') as file:
    file.write("Deployed on " + timestamp)


