class TestimonialDecorator < Draper::Decorator

  delegate_all

  def self.collection_decorator_class
    PaginatingDecorator
  end

  def options(resource)
    h.content_tag(:div) do
      button_show(resource) +
        space + space +
        button_edit(resource) +
        space + space +
        button_delete
    end
  end

  def button_show(resource)
    if resource.class.name == "Celebrity"
      route = h.admin_testimonial_path(object)
    elsif resource.class.name == "Client"
      route = h.admin_testimonial_path(object)
    end

    h.link_to route, class: 'black-text' do
      h.content_tag(:i,"visibility",class: 'material-icons')
    end
  end

  def button_edit(resource)
    if resource.class.name == "Celebrity"
      route = h.edit_admin_testimonial_path(object)
    elsif resource.class.name == "Client"
      route = h.edit_admin_testimonial_path(object)
    end

    h.link_to route, class: 'black-text' do
      h.content_tag(:i,"edit",class: 'material-icons')
    end
  end

  def button_delete
    h.content_tag(:a,href: "#",
                  'data-url': h.admin_testimonial_path(object),
                  'data-confirmation-text': "this testimonial",
                  'data-option-text': 'delete',
    class: "open-modal-confirmation red-text") do
      h.content_tag(:i,"delete",class: 'material-icons')
    end
  end

  def space
    h.content_tag(:span,"&nbsp;".html_safe)
  end

end
