class Service < ApplicationRecord
  include SortableConcern, PictureConcern

  has_many :service_categories, dependent: :destroy
  has_many :categories, through: :service_categories

  enum status: [:active, :desactive]

  accepts_nested_attributes_for :service_categories, allow_destroy: true

  has_attached_file :photo, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/assets/default.png"
  validates_attachment_content_type :photo, content_type: /\Aimage\/.*\z/

  validates :name, presence: true, length: { maximum: 50 }
  validates :image_url, url: { allow_blank: true }
  validates :description, length: { maximum: 1000}
  validate :validate_unique_service_categories

  attr_accessor :delete_photo

  before_validation { photo.clear if delete_photo == '1' }


  # ---------- CLASSES METHODS -----------------
  def self.filter_by_term(term)
    left_joins(service_categories: :category)
    .where("LOWER(services.name) LIKE ? OR LOWER(categories.name) LIKE ? ", "%#{term.downcase}%", "%#{term.downcase}%").group(:id)
  end

  def self.filter_by_featured
    where("services.featured = ?", true)
  end

  def self.except_other
    where.not("LOWER(services.name) = ?", 'other')
  end

  def self.only_other
    where("LOWER(services.name) = ?", 'other')
  end
  # ---------- END CLASSES METHODS -------------

  # ---------- INSTANCE METHODS ----------------
  # ---------- END INSTANCE METHODS ------------

  private

  def validate_unique_service_categories
    validate_uniqueness_of_in_memory(service_categories, [:category_id, :service_id], 'Duplicate categories')
  end


end
