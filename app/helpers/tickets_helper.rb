module TicketsHelper
  def ticket_state(ticket)
    image_tag "states/#{ticket.current_state}.png", :class => 'state'
  end
  
  def audit_state(audit)
    return unless status = audit.changes['status']
    
    case status
    when %w(new open)
      'Ticket has been accepted (now open)'
    when %w(open resolved)  
      'Ticket has been resolved (now closed)'
    when %w(open invalid), %w(new invalid)
      'Ticket has been marked as invalid (now closed)'
    else    
      %Q{Status changed from "#{status[0]}" to "#{status[1]}"}
    end  
  end
end
