# Basic odoo template servec with UWSGI for Platform.sh

<p align="center">
<a href="https://console.platform.sh/projects/create-project?template=https://raw.githubusercontent.com/platformsh/template-builder/master/templates/python3-uwsgi/.platform.template.yaml&utm_content=python3-uwsgi&utm_source=github&utm_medium=button&utm_campaign=deploy_on_platform">
    <img src="https://platform.sh/images/deploy/lg-blue.svg" alt="Deploy on Platform.sh" width="180px" />
</a>
</p>

This template provides a basic installation of odoo. It includes the `platformshconfig` package and demonstrates using it in the WSGI runner

Odoo is an open source ERP with a large user base.

## Features

* Python 3.11
* PostgreSQL 15
* Automatic TLS certificates
* Pipfile-based build

Because odoo is a python binary, it is installed directly into `/app/.global/bin/odoo` and is part of the PATH of every shell and program. 

The install is quite fast because all the python dependencies are cached and will only be updated if a new version is available.

## Customizations

If using this project as a reference for your own existing project, replicate the changes below to your project.

All the platform.sh specifics are in:
* `.platform.app.yaml`
* `build.sh` : If you want to install plugins to Odoo, this would be the place to add your own logic to install python plugins
* `deploy.sh` : This is mainly used to generate the demo. Once you have a production system you should not use this unless you want to start from scratch
* `odoo_wssgi.py`: This file contains the various argumennts require by odoo. In particular: directories for plugins, where to write the files, etc. Customize as needed
* `conf/uwsgi.py`: Tune this file according to your needs. The default one should work for most use cases.


## References

* [Python](https://www.python.org/)
* [Python on Platform.sh](https://docs.platform.sh/languages/python.html)
* [PostgreSQL on Platform.sh](https://docs.platform.sh/add-services/postgresql.html)
* [Odoo](https://www.odoo.com/)
