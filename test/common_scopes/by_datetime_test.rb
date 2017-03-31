require 'test_helper'

class CommonScopes::ByDatetimeTest < ActiveSupport::TestCase
  #   # module ClassMethods
  #     def self.scopes_for_attr(model, key)
  #       # NOTE: Find a cleaner way to extend models, I hate to use `eval` methods...
  #       arel_key = model.arel_table[key.to_sym]
  #
  #       model.class_eval do
  #         # Add a scope :by_[attribute name]_greater to perform a Greater than or equal query
  #         scope "by_#{key}_greater".to_sym, -> (param) {
  #           param = sanitize_date(param)
  #           where(arel_key.gte(param))
  #         }
  #
  #         # Add a scope :by_[attribute name]_lesser to perform a Lesser than or equal query
  #         scope "by_#{key}_lesser".to_sym, -> (param) {
  #           param = sanitize_date(param)
  #           where(arel_key.lte(param))
  #         }
  #
  #         # Add a scope :by_[attribute name]_between to perform a Lesser than or equal query
  #         scope "by_#{key}_between".to_sym, -> (min, max) {
  #           min = sanitize_date(min)
  #           max = sanitize_date(max)
  #           where(arel_key.between?(min, max))
  #         }
  #
  #         # Add a scope :by_[attribute name] to perform an exact match
  #         scope "by_#{key}".to_sym, -> (value) {
  #           value = sanitize_date(value)
  #           where(arel_key.eq(value))
  #         }
  #       end
  #     end
  #
  #     def self.sanitize_date(param)
  #       param = param.to_time unless param.is_a?(Datetime)
  #       param.to_s(:db) # Exclude timezone, as active record evaluate it if params is a date / datetime
  #     end
  # # end
end
