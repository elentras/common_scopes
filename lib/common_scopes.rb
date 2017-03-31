require 'active_support/all'
require 'common_scopes/version'
require 'common_scopes/railtie' if defined?(Rails)
require 'common_scopes/by_boolean'
require 'common_scopes/by_date'
require 'common_scopes/by_datetime'
require 'common_scopes/by_integer'
require 'common_scopes/by_string'

module CommonScopes
  extend ActiveSupport::Concern

  TYPES_HANDLED = %w(Boolean Integer Date Datetime String).freeze

  def self.included(klass)
    klass.columns_hash.each do |key, info|
      type = info.type
      next unless TYPES_HANDLED.include?(type)

      module_to_load = 'CommonScopes::By' + type
      class_extension = module_to_load.constantize

      # NOTE: Bad pattern design IMO, to review
      class_extension.scopes_for_attr(klass, key)
    end
  end

end
