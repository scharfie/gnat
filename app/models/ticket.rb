class Ticket < ActiveRecord::Base
  acts_as_audited
  
  belongs_to :project
  
  attr_accessor :user
  
public
  def write_audit(action = :update, user = nil)
    super action, user || User.current_user
  end

  def status
    # stub
    'OPEN'  
  end
  
  def user
    # stub -- ONLY using current_user for testing!!
    User.current_user
  end
end
