proofler
========

Build: [![Build Status](http://ci.vedaserve.com:8080/buildStatus/icon?job=proofler)](http://ci.vedaserve.com/job/proofler/)
Rubocop Status: [![RuboCop Status](http://ci.vedaserve.com:8080/buildStatus/icon?job=rubocop)](http://ci.vedaserve.com/job/rubocop/)
Dependencies: [![Dependency Status](http://ci.vedaserve.com:8080/buildStatus/icon?job=outdated-gems)](http://ci.vedaserve.com/job/outdated-gems/)

Available at: http://proofler.com

Staging Environment: http://staging.proofler.com

# Install dependencies (Ubuntu 14.10)

> sudo apt-get install libreadline-dev postgresql-server-dev-9.4

# Setup database

Create a new role and assign the password `proofler`.

> sudo -u postgres createuser -s -P proofler

# Run the tests

## Run once

> rspec spec/

## Run with guard

Guard watches for changes on models, controllers and tests and executes all tests that match the changed files.

> bundle exec guard

# Deploy

## Configure mail delivery

> heroku config:set SMTP_HOST=myserver.example SMTP_PORT=587 SMTP_USER=myuser SMTP_PASSWORD='aV3rYc0mplic4t3dP4$$w0rd'

To test that the email delivery works you can use the following one-liner a Rails console:

> ActionMailer::Base.mail(body: 'Email delivery test', to: 'my-test-address@mydomain.example', from: 'admin@invalid.example').deliver_now

## Configure ftp upload for images

> heroku config:set FTP_HOST=myserver.example FTP_USER=myuser FTP_PASSWORD='aV3rYc0mplic4t3dP4$$w0rd'

## Configure admin access

> heroku config:set PROOFLER_ADMIN_USER=username PROOFLER_ADMIN_SECRET=password
