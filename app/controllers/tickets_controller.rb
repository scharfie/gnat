class TicketsController < ApplicationController
  resources_controller_for :tickets #, :in => :project
  before_filter do |controller|
    controller.current_tab = controller.enclosing_resource ? 'Tickets' : 'All tickets'
  end
end