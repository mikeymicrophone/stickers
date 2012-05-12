module ApplicationHelper
  def links_to objects
    objects.map { |o| link_to o.name, o }.join(' ').html_safe
  end
  
  def cleardiv
    content_tag :div, :class => 'clearboth' do
      #nothing
    end
  end
end
