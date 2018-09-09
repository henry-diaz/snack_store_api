# README

Project requirements:

* Ruby 2.4.0
* Rails 5.2.1
* PostgreSQL 9.4 or higher
* RVM for ruby gemsets management (optional, the project includes the gemset files)
* React (To run the client integration)

## API collections

This project contains two files of Postman, to test the API:

* resources/Postman/Snacks store API.postman_collection.json contains the collection requests.
* resources/Postman/Snacks store API.postman_environment.json contains some environments var used in the Collection

## Database

This repo contains a dump database in the resources folder, the dump was downloaded from the Heroku App, with PostgreSQL version 10.5, you can always run `rake db:create` and `rake db:migrate` to create the schema database and start testing the API from a fresh installation.  
Important: rename **database.yml.template** to **database.yml** and configure the PostgreSQL credentials (User and Password).

## Credentials storage

The project use the credentials module from Rails so we must rename the following files:

* **credentials.yml.enc.template** to **credentials.yml.enc**
* **master.key.template** to **master.key**

With this change we can now edit these vars, running the command:

`EDITOR=nano rails credentials:edit`

This file is a yml one, edit these vars and save the file. The amazon s3 credentials are in this file (you can change the bucket name and region in the **config/storage.yml**) as well as the smtp credentials.  
If `EDITOR=nano rails credentials:edit` fails, you can always redo the yml credentials, by deleting the config/credentials.yml.enc and config/master.key and running again the command, now this creates a new pair of credentials files, the template used in this project is:

```
aws:
  access_key_id: '<your_aws_account_key>'
  secret_access_key: '<your_aws_account_access_key>'

email:
  address: 'smtp.gmail.com'
  port: 587
  domain: 'gmail.com'
  user_name: '<my_account>@gmail.com'
  password: '<my_account_password>'
  authentication: 'plain'
  enable_starttls_auto: true

# Used as the base secret for all MessageVerifiers in Rails, including the one protecting cookies.
secret_key_base: alongandsecurepasswordkeygeneratedwithrailssecretcommand
```

## Test users for API (In heroku app)

Cuenta de usuario  
usuario@prueba.com  
Test1234

Cuenta de administrador  
admin@prueba.com  
1234test

## Integration of React Client as a Front End demo

The react project is mounted on a client directory, we used **foreman** to run both client and API on one command:

`rake start`

Which uses a Procfile.dev to run web API on port 3001 and client npm on port 3000. Before run the project please do a `npm install` on the client directory.  
If `rake start` fails, for some reasons, you can always start the project with:  
`rails s -p 3001` on the root directory and `npm start` on the client one. The integration of foreman was intented to prevent this double start of both apps (Back End + Front End).
