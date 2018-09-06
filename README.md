# README

Project requirements:

* Ruby 2.4.0
* Rails 5.2.1
* PostgreSQL 9.4 or higher
* RVM for ruby gemsets management

Database:

This repo contains a dump database in the db folder, also, there is a database.yml.template that you must rename to database.yml to configure the PostgreSQL credentials (User and Password).

Credentials storage:

The project use the credentials module from Rails so we must rename the following files:

* credentials.yml.enc.template to credentials.yml.enc
* master.key.template to master.key

With this change we can now edit these vars, runnig the command

* EDITOR=nano rails credentials:edit

This file is a yml one, edit these vars and save the file. For example, the amazon s3 credentials are in this file, you can always change the bucket name and region in the config/storage.yml.
