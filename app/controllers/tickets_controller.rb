class TicketsController < ApplicationController
  resources_controller_for :tickets, :in => :project

public
  def accept
    self.resource = find_resource
    resource.accept!
    redirect_to resource_url(resource)
  end  

  def invalidate
    self.resource = find_resource
    resource.invalidate!
    redirect_to resource_url(resource)
  end  
end