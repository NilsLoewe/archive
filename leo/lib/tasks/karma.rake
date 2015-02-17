desc "Run karma test runner for JavaScript tests"
task :karma do
  sh "CHROME_BIN=chromium-browser ./node_modules/karma/bin/karma start jstest/config.coffee"
end
