#!/bin/bash
bundle exec rake assets:clean
bundle exec rake assets:precompile
git add --all
git commit -am 'Precompile assets for heroku'
git push
git push staging
heroku restart --app proofler-staging
