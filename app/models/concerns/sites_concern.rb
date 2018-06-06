module SitesConcern extend ActiveSupport::Concern
  module ClassMethods

    def match_with_categories_of_site(site)
      joins(:categories).where(categories: {id: site.categories}).group(:id)
    end

  end
end
