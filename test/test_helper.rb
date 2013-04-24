require 'rubygems'
require 'bundler/setup'

ENV['RAILS_ENV'] = 'test'
require File.expand_path('../dummy/config/environment.rb',  __FILE__)
require "rails/test_help"
require "mocha/setup"
require "active_support/test_case"
require "active_support/inflector"

Rails.backtrace_cleaner.remove_silencers!

ENGINE_RAILS_ROOT=File.join(File.dirname(__FILE__), '../')

# Load support files
Dir[File.join(ENGINE_RAILS_ROOT, 'test/support/**/*.rb')].each { |f| require f }
Dir[File.join(ENGINE_RAILS_ROOT, 'test/config/**/*.rb')].each { |f| require f }