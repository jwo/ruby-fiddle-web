require File.expand_path('../boot', __FILE__)

require 'rails/all'
Bundler.require(*Rails.groups)

module Rubyfiddle
  class Application < Rails::Application
    config.encoding = "utf-8"

  end
end
