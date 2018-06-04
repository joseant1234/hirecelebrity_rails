class Client < ApplicationRecord
  include SortableConcern, PictureConcern

  has_many :client_categories, dependent: :destroy
  has_many :categories, through: :client_categories
  has_many :testimonials, as: :resource, dependent: :destroy

  enum status: [:active, :desactive]

  accepts_nested_attributes_for :client_categories, allow_destroy: true

  has_attached_file :photo, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/default.png"
  validates_attachment_content_type :photo, content_type: /\Aimage\/.*\z/

  validates :name, presence: true
  validates :image_url, url: { allow_blank: true }
  validates :client_categories, length: { minimum: 1 }
  validate :validate_unique_client_categories

  attr_accessor :delete_photo

  before_validation { photo.clear if delete_photo == '1' }

  # ---------- CLASSES METHODS -------------
  def self.filter_by_term(term)
    left_joins(client_categories: :category).where("LOWER(clients.name) LIKE ? OR LOWER(categories.name) LIKE ?", "%#{term.downcase}%", "%#{term.downcase}%").group(:id)
  end

  def self.filter_by_featured
    where("clients.featured = ?", true)
  end
  # ---------- END CLASSES METHODS -------------

  # ---------- INSTANCE METHODS -------------
  # ---------- END INSTANCE METHODS ------------


  private

  def validate_unique_client_categories
    validate_uniqueness_of_in_memory(
    client_categories, [:category_id, :client_id], 'Duplicate categories')
  end

end
