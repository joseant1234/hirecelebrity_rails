module FrontHelper

  def li_paint_tab(text, path, controller_name)
    css_class = controller.controller_name == controller_name ? 'active' : ''
    content_tag(:li, class: css_class) do
      link_to text, path
    end
  end
end
