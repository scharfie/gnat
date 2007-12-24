class Ticket < ActiveRecord::Base
  belongs_to :project
  
public
  def status
    # stub
    'OPEN'  
  end
  
end
