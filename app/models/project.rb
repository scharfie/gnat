class Project < ActiveRecord::Base
  has_many :tickets
  has_many :milestones
  
  has_many :active_tickets, :class_name => 'Ticket',
    :conditions => 'status IN ("new", "open")'
  
public
  # returns a more friendly URL consisting of
  # id and key (i.e. 1-gnat)
  def to_param
    "#{id}-#{key}"
  end
end
