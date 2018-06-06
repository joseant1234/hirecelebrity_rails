class Testimonial < ApplicationRecord

  include SortableConcern, SitesConcern

  belongs_to :resource, polymorphic: true
  has_many :testimonial_categories, dependent: :destroy
  has_many :categories, through: :testimonial_categories

  validates :description, presence: true
  validates :description, length: { maximum: 500 }

  before_create :set_categories

  # ---------- CLASSES METHODS -----------------
  def self.filter_by_featured
    where("testimonials.featured = ?",true)
  end
  # ---------- END CLASSES METHODS -------------

  # ---------- INSTANCE METHODS ----------------
  # ---------- END INSTANCE METHODS ------------

  private

  def set_categories
    if self.resource_type == "Celebrity"
      categories_from_celebrity
    elsif self.resource_type == "Client"
      categories_from_client
    end
  end

  def categories_from_celebrity
    celebrity_categories = self.resource.celebrity_categories
    celebrity_categories.each do |celebrity_category|
      self.testimonial_categories.new(category_id: celebrity_category.category_id)
    end
  end

  def categories_from_client
    client_categories = self.resource.client_categories
    client_categories.each do |client_category|
      self.testimonial_categories.new(category_id: client_category.category_id)
    end
  end


end
