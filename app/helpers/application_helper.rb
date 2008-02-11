# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper
  def heading(text=nil, &block)
    content_for :heading, text, &block
  end
  
  # captures given block and stores the result
  # for use with yield :head (placed within HEAD tag)
  def head(text=nil, &block)
    content_for :head, text, &block
  end
  
  
  def span(text, options={})
    content_tag :span, text, options
  end
  
  def badge(text)
    %{<span class="badge badge-#{text}">#{text}</span>}
  end
  
  def avatar(user=nil, options={})
    options.reverse_merge! :badge => false
    "<div class=\"avatar\">" + 
      image_tag('avatar.gif') + 
      (options[:badge] && user.developer? ? badge('developer') : '') +
    '</div>'
  end
end