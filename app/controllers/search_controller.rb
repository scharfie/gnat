class SearchController < ApplicationController
  def index
    perform_search #and return if request.post?
    # render :text => 'Hey, what are you doing here?  (Search#index)'
  end
  
protected
  def perform_search
    @results = Dictionary.new
    @results['Tickets'] = Ticket.find_by_contents(params[:q])
    @results['Comments'] = Audit.find_by_contents(params[:q])
  end
end
