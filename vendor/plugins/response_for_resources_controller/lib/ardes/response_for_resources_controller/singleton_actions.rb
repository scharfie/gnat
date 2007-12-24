module Ardes#:nodoc:
  module ResponseForResourcesController#:nodoc:
    # actions using response_for
    module SingletonActions
      def self.included(base)
        base.class_eval do
          response_for :show, :new, :edit do |format|
            format.html
            format.js
            format.xml  { render :xml => resource }
          end
          
          response_for :destroy do |format|
            format.html do
              flash[:notice] = "#{resource_name.humanize} was successfully destroyed."
              redirect_to enclosing_resource_url if enclosing_resource
            end
            format.js
            format.xml
          end
          
          response_for :create do |format|
            if resource_saved?
              format.html do
                flash[:notice] = "#{resource_name.humanize} was successfully created."
                redirect_to resource_url
              end
              format.js
              format.xml  { render :xml => resource, :status => :created, :location => resource_url }
            else
              format.html { render :action => "new" }
              format.js   { render :action => "new" }
              format.xml  { render :xml => resource.errors, :status => :unprocessable_entity }
            end
          end
          
          response_for :update do |format|
            if resource_saved?
              format.html do
                flash[:notice] = "#{resource_name.humanize} was successfully updated."
                redirect_to resource_url
              end
              format.js
              format.xml  { head :ok }
            else
              format.html { render :action => "edit" }
              format.js   { render :action => "edit" }
              format.xml  { render :xml => resource.errors, :status => :unprocessable_entity }
            end
          end
        end
      end
      
      def show
        self.resource = find_resource
      end

      def new
        self.resource = new_resource
      end

      def edit
        self.resource = find_resource
      end

      def create
        self.resource = new_resource
        save_resource
      end
      
      def update
        self.resource = find_resource
        resource.attributes = params[resource_name]
        save_resource
      end

      def destroy
        self.resource = find_resource
        resource.destroy
      end
    end
  end
end
