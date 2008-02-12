class SearchController < ApplicationController
  def index
    perform_search
  end
  
protected
  def perform_search
    term = params[:q]
    q = "(#{term})^2 OR (#{term.split.map {|t| '*' + t + "*" }.join(' ')})"
    
    @results = Dictionary.new
    @results['Tickets'] = Ticket.find_by_contents(q)
    @results['Comments'] = Audit.find_by_contents(q)
  end
end
