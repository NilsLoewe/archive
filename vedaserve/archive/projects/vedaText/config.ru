# This file is used by Rack-based servers to start the application.

require ::File.expand_path('../config/environment',  __FILE__)
require ::File.expand_path('../config/faye',  __FILE__)

run VedaText::Faye.new(VedaText::Application)
