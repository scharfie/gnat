module TicketsHelper
  def ticket_state(ticket)
    # image_tag "states/#{ticket.current_state}.png", :class => 'state'
    badge ticket.current_state
  end
  
  def audit_state(audit)
    return unless status = audit.changes['status']
    
    case status
    when %w(new open)
      'Ticket has been accepted'
    when %w(open resolved)  
      'Ticket has been closed as resolved'
    when %w(open invalid), %w(new invalid)
      'Ticket has been marked as invalid'
    when %w(invalid open), %w(resolved open)
      %Q{Ticket has been re-opened (was marked as #{status[0]})}  
    else
      %Q{Status changed from "#{status[0]}" to "#{status[1]}"}
    end  
  end
  
  def audit_milestone(audit)
    return unless values = audit.changes['milestone_id']
    return if values.compact == [0]
    
    milestones = values.map do |e|
      Milestone.find_by_id(e)
    end
    
    base = 'Milestone set to ' + (milestones[1] ? milestones[1].name : 'nothing')
    base += " (was #{milestones[0].name})" if milestones[0]
    base
  end
  
  def audit_assigned_to(audit)
    return unless values = audit.changes['assigned_to_id']
    return if values.compact == [0]
    
    developers = values.map { |e| User.find_by_id(e) }
    
    base = 'Assigned to ' + (developers[1] ? developers[1].login : 'no-one')
    base += " (was #{developers[0].login})" if developers[0]
    base
  end
  
  def audit_due_date(audit)
    return unless values = audit.changes['due_on']
    return if values.compact == [0]
    
    base = 'Due on ' + format_time(values[1], :dmy)
    base += ' (was due ' + format_time(audit.created_at, :dmy) + ')' if values[0]
    base
  end
  
  def audit_changes(audit)
    changes = []
    changes << audit_state(audit)
    changes << audit_milestone(audit)
    changes << audit_assigned_to(audit)
    changes << audit_due_date(audit)
    changes.compact!
    return if changes.empty?
    changes.map! { |e| content_tag :li, e }
    content_tag :ul, changes, :class => 'changes'
  end
end