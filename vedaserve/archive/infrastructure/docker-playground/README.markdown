# Proofler

**Enabling good decisions.**

# Setup

Install [Docker 1.2](http://docker.com/) and [fig 0.5.2](http://fig.sh/).

# Start all containers

    sudo fig up

# Services

* Frontend (Nginx): [http://localhost:8080/](http://localhost/)
* Users API (Sinatra): [http://localhost:4567/hi](http://localhost:4567/hi)

# Integration

* slack: When this repostiory gets pushed, the #general channel in [slack](https://slack.com) will get notified.
