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
    when %w(invalid open), %w(resolved open)
      %Q{Ticket has been re-opened (was marked as #{status[0]})}  
    else    
      %Q{Status changed from "#{status[0]}" to "#{status[1]}"}
    end  
  end
  
  def audit_changes(audit)
    changes = []
    changes << audit_state(audit)
    
    changes.compact!
    return if changes.empty?
    changes.map! { |e| content_tag :li, e }
    content_tag :ul, changes, :class => 'changes'
  end
  
end