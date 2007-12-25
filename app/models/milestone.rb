class Milestone < ActiveRecord::Base
  belongs_to :project
  has_many :tickets
end
