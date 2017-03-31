class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true

  # Fake column_hash to return each expected types
  def self.columns_hash
    return OpenStruct.new(
      my_date:      { type: 'Date' },
      my_datetime:  { type: 'Datetime' },
      my_integer:   { type: 'Integer' },
      my_string:    { type: 'String' }
    )
  end

  include CommonScopes
end
