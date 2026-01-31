require_relative "boot"

require "rails/all"


Bundler.require(*Rails.groups)

module Lojinha
  class Application < Rails::Application
    config.load_defaults 7.2

    config.autoload_lib(ignore: %w[assets tasks])

    config.i18n.available_locales = ["pt-BR"]
    config.i18n.default_locale = "pt-BR"

    config.time_zone = "Brasilia"

  end
end
