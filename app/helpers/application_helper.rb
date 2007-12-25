# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper
  def heading(text=nil, &block)
    content_for :heading, text, &block
  end
  
  def span(text, options={})
    content_tag :span, text, options
  end
end
