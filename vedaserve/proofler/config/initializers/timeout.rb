# There is no request timeout mechanism inside of Puma. The Heroku
# router will timeout all requests that exceed 30 seconds.
# https://devcenter.heroku.com/articles/deploying-rails-applications-with-the-puma-web-server#timeout
Rails.application.middleware.use Rack::Timeout
Rack::Timeout.timeout = (Rails.env.production? ? 20 : 0)
