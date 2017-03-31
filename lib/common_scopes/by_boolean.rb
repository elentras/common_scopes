module CommonScopes::ByBoolean

  def scopes_for_attr(model, key)
    # NOTE: Find a cleaner way to extend models, I hate to use `eval` methods...
    arel_key = model.arel_table[key.to_sym]

    model.instance_eval do
      # Add a scope :by_[attribute name]_greater to perform a Greater than or equal query
      scope "by_#{key}_greater", -> (param) {
        param = sanitize_boolean(param)

        where(arel_key.gte(param))
      }

      # Add a scope :by_[attribute name]_lesser to perform a Lesser than or equal query
      scope "by_#{key}_lesser", -> (param) {
        param = sanitize_boolean(param)

        where(arel_key.lte(param))
      }

      scope "by_#{key}_between", -> (min, max) {
        min = sanitize_boolean(min)
        max = sanitize_boolean(max)

        where(arel_key.between?(min, max))
      }

      # Add a scope :by_[attribute name] to perform an exact match
      scope "by_#{key}", -> (value) {
        value = sanitize_boolean(value)

        where(arel_key.eq(value))
      }
    end
  end

  def self.sanitize_boolean(value)
    [true, false, 0, 1].include?(value)
  end
end
