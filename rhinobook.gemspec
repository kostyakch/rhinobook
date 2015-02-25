$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "rhinobook/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "rhinobook"
  s.version     = Rhinobook::VERSION
  s.authors     = ["Konstantin Chernyaev"]
  s.email       = ["kch@list.ru"]
  # s.homepage    = "TODO"
  s.summary     = "Rhinobook is a library plugin for Rhinoart CMS"
  s.description = "Rhinobook is a library plugin for Rhinoart CMS"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.rdoc"]
  s.test_files = Dir["test/**/*"]

  s.add_dependency "rails"#, "~> 4.0.10"
  s.add_dependency "bcrypt-ruby"
  s.add_dependency "will_paginate"
  s.add_dependency "acts_as_list"

  s.add_dependency "haml-rails", "~> 0.4.0"

  s.add_dependency "jquery-rails"
  s.add_dependency 'sass-rails'

  # s.add_dependency 'globalize', '~> 4.0.1'
  # s.add_dependency 'globalize-accessors'
  # s.add_dependency 'paper_trail', '~> 3.0.3'
  # s.add_dependency 'globalize-versioning', '~> 0.1.0.alpha.1' 

  s.add_dependency "mini_magick"
  s.add_dependency "carrierwave"

  s.add_dependency 'sanitize'

  s.add_dependency 'actionpack-action_caching'

end
