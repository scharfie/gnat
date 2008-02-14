module SearchHelper
  def search_result_link(result)
    method = "#{result.class.to_s.underscore}_result_link"
    respond_to?(method) ? send(method, result) : 'TODO'
  end
  
  def search_result_description(result)
    method = "#{result.class.to_s.underscore}_result_description"
    respond_to?(method) ? send(method, result) : 'TODO'
  end
  
  def ticket_result_link(ticket)
    link_to ticket.title, project_ticket_path(ticket.project_id, ticket)
  end
  
  def audit_result_link(result)
    ticket_result_link(result.auditable)
  end
  
  def ticket_result_description(ticket)
    truncate ticket.description, 200
  end
  
  def audit_result_description(audit)
    audit.comments
  end
end
