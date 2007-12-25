class TicketsController < ApplicationController
  resources_controller_for :tickets #, :in => :project
end