This is the project officially known as vedascan!

# Tests

We run a continous integration environment at [ci.vedaserve.de](http://ci.vedaserve.de).

# Technology stack

* `Rails` as rack based MVC framework
* `RabbitMQ` as message bus
* `Thin` as the application server
* `PostgreSQL` as the persistence layer
* `Faye` for synchronous client communication
* `Rspec` to test

# Development Environment

You can find a [setup guide](https://github.com/Vedaserve/VedaScan/wiki/Setup) in the Wiki.

## Start the services
* Call `rails server` to start the frontend
* Call `bundle exec rake wurzelzwerg:worker` to start a worker instance

# Deployment

We're using Capistrano for deployments.

## Setup and verify SSH

You have to be able to connect the app and database servers using the `deploy` user, that Chef will automatically setup.
The best way to make sure that Capistrano will not run into any troubles, is to setup your `~/.ssh/config` file with the
following content:

    Host *.vedaserve.com
      User deploy
      IdentityFile ~/.ssh/vedascan.pem

You can test this by executing `cap shell` and typing a command like `hostname -f` to see if Capistrano is able to
execute that command on each host.

## Deploying

To deploy the whole application (including assets and database migrations), you have to execute `cap deploy:migrations`.

## Deploying to a new server

Make sure that the server is propper setup by executing `cap deploy:setup`.

If the server is an app server, the default deployment will currently fail to restart thin, because it's not running.
You have to execute the `cap deploy:start` task in order to start thin initially. On every subsequent deployment, the
thin restart task will be executed automatically.
