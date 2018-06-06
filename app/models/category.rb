class Category < ApplicationRecord

  include SortableConcern

  has_many :organization_categories, dependent: :destroy
  has_many :organization, through: :organization_categories
  has_many :client_categories, dependent: :destroy
  has_many :clients, through: :client_categories
  has_many :testimonial_categories, dependent: :destroy
  has_many :site_categories, dependent: :destroy
  has_many :sites, through: :site_categories

  enum status: [:active, :desactive]

  validates_presence_of :name, :description
  validates :description, length: { maximum: 1000 }

  before_create :assign_category_to_featured_site

  # ---------- CLASSES METHODS -------------
   def self.filter_by_term(term)
     where("LOWER(categories.name) LIKE ?", "%#{term.downcase}%")
   end

   def self.filter_by_featured
     where("categories.featured = ?", true)
   end

   def self.match_with_categories_of_site(site)
     where(categories: {id: site.categories})
   end

   # ---------- END CLASSES METHODS -------------

   # ---------- INSTANCE METHODS -------------

   # ---------- END INSTANCE METHODS ------------

   private
   def assign_category_to_featured_site
     site = Site.featured.last
     self.site_categories.new(site: site) if site.present?
   end
end
