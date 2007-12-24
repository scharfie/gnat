class ActiveRecord::Base
  def self.inherited(klass)
    klass.alias_attribute :created_on, :created_at
    klass.alias_attribute :updated_on, :updated_at
  end
end