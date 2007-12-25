class Ticket < ActiveRecord::Base
  acts_as_audited :except => [:project_id]
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
  
  attr_accessor :user, :comments
public
  def write_audit(action = :update, user = nil)
    user ||= User.current_user
    self.audits.create :changes => @changed_attributes || {}, 
      :action => action.to_s, :user => user,
      :comments => self.comments
  end
  
  def changed?(attr_name = nil)
    self.comments.blank? ? super : true
  end  
  
  def closed?
    invalid? || resolved?
  end

  def user
    # stub -- ONLY using current_user for testing!!
    User.current_user
  end
end
