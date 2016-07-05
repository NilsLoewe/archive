# see http://middlemanapp.com/advanced/configuration/

I18n.enforce_available_locales = true

activate :livereload

activate :deploy do |deploy|
  deploy.build_before = true
  deploy.method = :git
end

configure :build do
end
