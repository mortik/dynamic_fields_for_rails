# frozen_string_literal: true

lib = File.expand_path('lib', __dir__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'dynamic_fields_for_rails/version'

Gem::Specification.new do |spec|
  spec.name          = 'dynamic_fields_for_rails'
  spec.version       = DynamicFieldsForRails::VERSION
  spec.authors       = ['Marten Klitzke']
  spec.email         = ['m.klitzke@gmail.com']
  spec.description   = 'Dynamic fields helper for Rails.'
  spec.summary       = 'Helper for nested forms with dynamic fields.'
  spec.homepage      = 'https://github.com/mortik/dynamic_fields_for_rails'
  spec.license       = 'MIT'

  spec.files = Dir["{app,config,db,lib}/**/*", "LICENSE.txt", "Rakefile", "README.md"]
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ['lib']

  spec.add_development_dependency 'bundler', '~> 2.2', '> 1'
  spec.add_development_dependency 'mocha', '~> 1', '> 1'
  spec.add_development_dependency 'rake', '~> 13', '> 12'
  spec.add_development_dependency 'sqlite3', '~> 1', '> 1'

  spec.add_dependency 'rails', '>= 3.0.0', '< 8.0.0'
end
