$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "birdses/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "birdses"
  s.version     = Birdses::VERSION
  s.authors     = ["Maximilian Haack"]
  s.email       = ["mxhaack@gmail.com"]
  s.homepage    = "https://github.com/coffeejunk/birdses"
  s.summary     = "gollum wiki as a mountable rails engine"
  s.description = "gollum wiki as a mountable rails engine"

  s.files = Dir["{app,config,db,lib}/**/*"] + ["MIT-LICENSE", "Rakefile", "README.md"]
  s.test_files = Dir["spec/**/*"]

  s.add_dependency "rails", "~> 3.2.11"
  s.add_dependency "gollum", "~> 2.4.11"

  s.add_development_dependency 'rspec-rails'
end
