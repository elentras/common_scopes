module CommonScopes::ByString

  def self.scopes_for_attr(model, key)
    # NOTE: Find a cleaner way to extend models, I hate to use `eval` methods...
    arel_key = model.arel_table[key.to_sym]

    model.instance_eval do
      # Add a scope :by_[attribute name] to perform a LIKE query
      scope "by_#{key}", -> (param) {
        self.where(arel_key.matches("%#{param}%"))
      }

      # Add a scope :not_by_[attribute name] to perform a NOT LIKE query
      scope "not_by_#{key}", -> (param) {
        self.where(arel_key.does_not_match("%#{param}%"))
      }

      scope "by_#{key}_start", -> (param) {
        self.where(arel_key.matches("#{param}%"))
      }

      self.scope "by_#{key}_end", -> (param) {
        where(arel_key.matches("%#{param}"))
      }
    end
  end
end
