module Birdses
  class Engine < ::Rails::Engine
    isolate_namespace Birdses
    config.generators do |g|
      g.test_framework :rspec, :view_specs => false
    end
    require 'gollum_editor'
  end
end
