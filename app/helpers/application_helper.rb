# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper
  def heading(text=nil)
    content_for :heading, content_tag(:h2, text)
  end
  
  def span(text, options={})
    content_tag :span, text, options
  end
end
