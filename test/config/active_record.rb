# frozen_string_literal: true

# rubocop:disable ClassAndModuleChildren
# rubocop:disable Style/ClassVars
class ActiveRecord::Base
  mattr_accessor :shared_connection
  @@shared_connection = nil

  def self.connection
    @@shared_connection || retrieve_connection
  end
end
# rubocop:enable Style/ClassVars
# rubocop:enable ClassAndModuleChildren
ActiveRecord::Base.shared_connection = ActiveRecord::Base.connection
