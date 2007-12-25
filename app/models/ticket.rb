class Ticket < ActiveRecord::Base
  acts_as_audited
  
  belongs_to :project
  
public
  def write_audit(action = :update, user = nil)
    super action, user || User.current_user
  end

  def status
    # stub
    'OPEN'  
  end
end
