# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper
  def heading(text=nil)
    content_for(:heading, text)
  end
end
