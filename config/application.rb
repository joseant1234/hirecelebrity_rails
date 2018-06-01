require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Hirecelebrity
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 5.1

    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.

    ActionView::Base.field_error_proc = Proc.new do |html_tag, instance|
      class_attr_index = html_tag.index 'class="'
      if class_attr_index
        html_tag.insert class_attr_index+7, 'validation--failed invalid '
      else
        html_tag.insert html_tag.index('>'), ' class="validation--failed invalid"'
      end
    end
  end
end
