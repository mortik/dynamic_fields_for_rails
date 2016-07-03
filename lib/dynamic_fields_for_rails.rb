require "dynamic_fields_for_rails/version"

module DynamicFieldsForRails
  class Engine < Rails::Engine
  end

  mattr_accessor :add_css_classes
  @@add_css_classes = "add_fields"

  mattr_accessor :delete_css_classes
  @@delete_css_classes = "remove_fields"

  def self.setup
    yield self
  end
end
