require_relative "boot"
require "rails"
require "active_model/railtie"
require "active_record/railtie"
require "action_controller/railtie"
require "action_view/railtie"
require "propshaft/railtie"
Bundler.require(*Rails.groups)

module MiniatureCatalog
  class Application < Rails::Application
    config.load_defaults 8.1
    config.autoload_lib(ignore: %w[assets tasks])
    config.time_zone = "America/Sao_Paulo"
    config.i18n.available_locales = [:en]
    config.i18n.default_locale = :en
    config.generators.system_tests = nil
  end
end
