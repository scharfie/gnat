# Filters added to this controller apply to all controllers in the application.
# Likewise, all the methods added will be available for all controllers.

class ApplicationController < ActionController::Base
  include AuthenticatedSystem
  attr_accessor :current_project
  helper_method :current_project
  
  helper :all # include all helpers, all the time

  # See ActionController::RequestForgeryProtection for details
  # Uncomment the :secret if you're not using the cookie session store
  protect_from_forgery # :secret => '3af1edd2f9a47186fb585ca53affeacd'

  before_filter :get_current_user
 
  # manually load the enclosing resources
  # and then capture the project
  before_filter :load_enclosing_resources
  before_filter :capture_project

protected
  # stub method for non-RC controllers
  def load_enclosing_resources
    # this is a stub method for controllers
    # that do not use RC
  end

  def capture_project
    self.current_project = @project
  end
 
  def get_current_user
    User.current_user = self.current_user
  end
end