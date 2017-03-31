module CommonScopes::ByDate
  def self.scopes_for_attr(model, key)
    # NOTE: Find a cleaner way to extend models, I hate to use `eval` methods...
    arel_key = model.arel_table[key.to_sym]

    model.instance_eval do

      def sanitize_date(param)
        param = param.to_date unless param.is_a?(Date)
        param.to_s(:db) # Exclude timezone, as active record evaluate it if params is a date / datetime
      end

      # Add a scope :by_[attribute name]_greater to perform a Greater than or equal query
      scope "by_#{key}_greater", -> (param) {
        param = sanitize_date(param)
        where(arel_key.gte(param))
      }

      # Add a scope :by_[attribute name]_lesser to perform a Lesser than or equal query
      scope "by_#{key}_lesser", -> (param) {
        param = sanitize_date(param)
        where(arel_key.lte(param))
      }

      # Add a scope :not_by_[attribute name] to perform a Lesser than or equal query
      scope "by_#{key}_between", -> (min, max) {
        min = sanitize_date(min)
        max = sanitize_date(max)
        where(arel_key.between?(min, max))
      }

      # Add a scope :by_[attribute name] to perform an exact match
      scope "by_#{key}", -> (value) {
        value = sanitize_date(value)
        where(arel_key.eq(value))
      }
    end

  end

end
