class ProjectsController < ApplicationController
  resources_controller_for :projects
  self.current_tab = 'Projects'

public
  def show
    redirect_to project_tickets_url(params[:id])
  end  
end