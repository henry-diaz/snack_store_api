# README

Project requirements:

* Ruby 2.4.0
* Rails 5.2.1
* PostgreSQL 9.4 or higher
* RVM for ruby gemsets management (optional, the project includes the gemset files)
* React (To run the client integration)

## Database

This repo contains a dump database in the db folder, also, there is a **database.yml.template** that you must rename to **database.yml** to configure the PostgreSQL credentials (User and Password).

## Credentials storage

The project use the credentials module from Rails so we must rename the following files:

* **credentials.yml.enc.template** to **credentials.yml.enc**
* **master.key.template** to **master.key**

With this change we can now edit these vars, running the command:

`EDITOR=nano rails credentials:edit`

This file is a yml one, edit these vars and save the file. For example, the amazon s3 credentials are in this file (you can change the bucket name and region in the **config/storage.yml**) as well as smtp credentials.

## Test users for API

Cuenta de usuario  
usuario@prueba.com  
Test1234

Cuenta de administrador  
admin@prueba.com  
1234test

## Integration of React Client as a Front End demo

The react project is mounted on a client directory, we are gonna use **foreman** to run both client and API on one command:

`rake start`

Which uses a Procfile.dev to run web API on port 3001 and client npm on port 3000, using only one command.
