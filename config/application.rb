require File.expand_path('../boot', __FILE__)
require 'rails/all'

Bundler.require(*Rails.groups)

module CrmMentions
 
  class Application < Rails::Application
  
    config.i18n.default_locale = :en

    config.autoload_paths << Rails.root.join('app/models/services')
    
    config.active_record.raise_in_transactional_callbacks = true
  
  end
end
