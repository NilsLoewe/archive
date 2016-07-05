# Users microservice

This microservice is part of Proofler.

It has to following properties:

- Manages users and passwords.
- Provides a JSON based RESTful API

# Technologies

- Sinatra 1.4
- ActiveRecord 4.1
- Thin 1.6

# Setup database

Create the database
> bundle exec rake db:create

Migrate the database
> bundle exec rake db:migrate

Load seed data into the database
> bundle exec rake db:seed

# Testing

Run all tests
> bundle exec rake test

# Debugging

Load a interactive session
> bundle exec rake console

Print all routes
> bundle exec rake routes

# Inspiration

* http://blog.sourcing.io/structuring-sinatra
* http://www.sinatrarb.com/testing.html#rspec
