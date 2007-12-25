class Ticket < ActiveRecord::Base
  acts_as_audited
  acts_as_state_machine :initial => :new, :column => :status
  
  state :new
  state :open
  state :resolved
  state :invalid
  
  event :accept do
    transitions :from => :new, :to => :open
  end
  
  event :resolve do
    transitions :from => :open, :to => :resolved
  end
  
  event :invalidate do
    transitions :from => :new, :to => :invalid
    transitions :from => :open, :to => :invalid
  end
  
  belongs_to :project
  
  attr_accessor :user
public
  def write_audit(action = :update, user = nil)
    super action, user || User.current_user
  end

  # def status
  #   # stub
  #   'OPEN'  
  # end
  
  def user
    # stub -- ONLY using current_user for testing!!
    User.current_user
  end
end
