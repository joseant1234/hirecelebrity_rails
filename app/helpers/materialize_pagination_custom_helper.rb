module MaterializePaginationCustomHelper
  class PaginateMaterailizeLinkRenderer < WillPaginate::ActionView::LinkRenderer

    # @return [String] list of pagination links
    def html_container(html)
      tag :div, tag(:ul, html, :class => "pagination"), class: 'row'
    end

    # @return [String] rendered pagination link
    def page_number(page)
      classes = ['waves-effect', ('active' if page == current_page)].join(' ')
      list_item = tag :li, link(page, page, :rel => rel_value(page)), :class => classes
    end

    # @return [String] rendered gap between pagination links
    def gap
      # tag :li, link('&hellip;'.html_safe, '#'), :class => 'disabled'
      tag :li, tag(:span,"<i class='material-icons'>more_horiz</i>".html_safe), class: 'blue-grey-text'
    end

    # @return [String] rendered previous and next arrow links
    def previous_or_next_page(page, text, classname)
      classes = [(classname if @options[:page_links]), ('disabled' unless page)].join(' ')
      chevron_direction = classname == 'previous_page' ? 'left' : 'right'
      if page
        tag :li, link("<i class='material-icons'>chevron_#{chevron_direction}</i>".html_safe, page), class: classes
      else
        tag :li, tag(:span,"<i class='material-icons'>chevron_#{chevron_direction}</i>".html_safe), class: 'blue-grey-text'
      end
    end

  end
end
