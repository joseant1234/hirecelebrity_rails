module ApplicationHelper

  def sortable(column, title = nil)
    title ||= column.titleize
    css_class = (column == sort_column) ? "current #{sort_direction}" : nil
    direction = (column == sort_column && sort_direction == "asc") ? "desc" : "asc"
    link_to title, {:sort => column, :direction => direction, :term => params[:term]}, {:class => css_class, remote: true}
  end

  def fee_range(object)
    return "$#{number_with_delimiter(object.fee_min, :delimiter => ',')} +" if object.fee_max.blank?
    return "$#{number_with_delimiter(object.fee_min, :delimiter => ',')} - $#{number_with_delimiter(object.fee_max, :delimiter => ',')}"
  end

  def current_site
    @current_site ||= Site.active.find_by_url(request.domain)
  end
  
  def class_enum_for_select class_name, enum_name
    class_name.constantize.send(enum_name.pluralize).keys.map {|k| [k.humanize, k]}
  end

end
