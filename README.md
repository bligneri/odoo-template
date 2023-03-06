# Basic odoo template servec with UWSGI for Platform.sh

<a href="https://console.platform.sh/projects/create-project/?template=https://github.com/bendll/odoo-template&utm_campaign=deploy_on_platform?utm_medium=button&utm_source=affiliate_links&utm_content=https://github.com/bendll/odoo-template" target="_blank" title="Deploy with Platform.sh"><img src="https://platform.sh/images/deploy/deploy-button-lg-blue.svg"></a>

This template provides a basic installation of odoo. It includes the `platformshconfig` package and demonstrates using it in the WSGI runner

Odoo is an open source ERP with a large user base.

## Features

* Python 3.11
* PostgreSQL 15
* Automatic TLS certificates
* Pipfile-based build

## Odoo version selection

You can change the `odoo_version` text file and it should work

It as only been tested with the `16.0` version of odoo. For other versions, you may have to tweak:
* The python version of the application 
* deploy.sh: The command line options of the oddo initialization
* run.sh: The command line options to launch odoo

## Building should be fast after the first pass

The install is quite fast because we are using the platform.sh cache system:
* After the first `git clone` of the Odoo tree, it should be a simple quick git check for the files (as the branch is fixed and should not change)
* Every python module is cached (wheel files) including `odoo` itself
* When new versions will be launched, it will require some work but only as needed

## Customizations

If using this project as a reference for your own existing project, replicate the changes below to your project.

All the platform.sh specifics are in:
* `.platform.app.yaml`
* `build.sh` : If you want to install plugins to Odoo, this would be the place to add your own logic to install python plugins
* `deploy.sh` : This is mainly used to generate the demo. Once you have a production system you should not use this unless you want to start from scratch
* `run.sh`: It uses the platform.sh generated environment variable to launch odoo

## What to do once it is deployed

* Log in into the admin with `admin`, `admin` and change your password 
* Then you can install apps (top left corner)
* You can also test the user view with the user `demo`, `demo`
* Upgrades from the web interface are not working. 
* Most certainly not ready for production: consider it experimental or a starting point to meet your needs.

## References

* [Python](https://www.python.org/)
* [Python on Platform.sh](https://docs.platform.sh/languages/python.html)
* [PostgreSQL on Platform.sh](https://docs.platform.sh/add-services/postgresql.html)
* [Odoo](https://www.odoo.com/)
