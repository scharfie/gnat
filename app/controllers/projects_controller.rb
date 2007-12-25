class ProjectsController < ApplicationController
  resources_controller_for :projects

public
  def show
    redirect_to project_tickets_url(params[:id])
  end  
end
