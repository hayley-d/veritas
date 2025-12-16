require_relative "boot"

require "rails/all"

Bundler.require(*Rails.groups)

module Veritas
  class Application < Rails::Application
    config.load_defaults 8.0

    config.autoload_lib(ignore: %w[assets tasks])

    config.generators do |generators|
      generators.orm :active_record, primary_key_type: :uuid
    end

    config.time_zone = "Africa/Johannesburg"
    config.active_record.default_timezone = :utc
  end
end
