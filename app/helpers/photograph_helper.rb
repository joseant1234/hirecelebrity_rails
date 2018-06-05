module PhotographHelper

  def banner_remaing_amount(site)
    content_tag(:span,
    Photograph::MAX_IMAGE_PER_BANNER - site.photographs.banner.count,
    id: 'banner_count')
  end

  def who_we_are_remaing_amount(site)
    content_tag(:span,
    Photograph::MAX_IMAGE_PER_WHO_ARE - site.photographs.who_we_are.count,
    id: 'who_we_are_count')
  end

end
