module ApplicationHelper
  def links_to objects
    objects.map { |o| link_to o.name, o }.join(' ').html_safe
  end
end
