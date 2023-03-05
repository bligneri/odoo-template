# WSGI Handler sample configuration file.
#
# Change the appropriate settings below, in order to provide the parameters
# that would normally be passed in the command-line.
# (at least conf['addons_path'])
#
# For generic wsgi handlers a global application is defined.
# For uwsgi this should work:
#   $ uwsgi_python --http :9090 --pythonpath . --wsgi-file openerp-wsgi.py
#
# For gunicorn additional globals need to be defined in the Gunicorn section.
# Then the following command should run:
#   $ gunicorn odoo:service.wsgi_server.application -c openerp-wsgi.py

import sys,os
import odoo
from platformshconfig import Config

# Get the Platform.sh information for the database
# Create a new Config object to ease reading the Platform.sh environment variables.
# You can alternatively use os.environ yourself.
config = Config()

# The 'database' relationship is generally the name of primary SQL database of an application.
# That's not required, but much of our default automation code assumes it.' \
database = config.credentials('postgresql')

 
#----------------------------------------------------------
# Common
#----------------------------------------------------------
odoo.multi_process = False # Nah!

# Equivalent of --load command-line option
odoo.conf.server_wide_modules = ['web']
conf = odoo.tools.config

#conf['addons_path'] = '/home/YOUR-USERNAME/my_apps/odoo/odoo/addons'

database['host'],
            'port': database['port'],
            'dbname': database['path'],
            'user': database['username'],
            'password': database['password']
conf['db_user'] = database['username']
conf['db_password'] =  database['password']
conf['db_name'] = database['path']
conf['db_host'] = database['host']
conf['db_port'] = database['port']
conf['db_template'] = 'template1'
#conf['dbfilter'] = '^YOUR-PG-DATABASE$'
conf['data_dir'] = '/app/odoo/'
conf['admin_passwd'] = 'adminpassword'

#----------------------------------------------------------
# Generic WSGI handlers application
#----------------------------------------------------------
application = odoo.service.wsgi_server.application

odoo.service.server.load_server_wide_modules()
