class Organization < ApplicationRecord

  include SortableConcern

  has_many :organization_categories, dependent: :destroy
  has_many :celebrities, through: :organization_categories

  enum status: [:active, :desactive]

  accepts_nested_attributes_for :organization_categories, allow_destroy: true

  has_attached_file :photo, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/default.png"
  validates_attachment_content_type :photo, content_type: /\Aimage\/.*\z/

  validates_presence_of :name
  validates :description, length: { maximum: 2000 }
  validates :extract, length: { maximum: 500 }
  validates :image_url, url: { allow_blank: true }
  validates :organization_categories, length: { minimum: 1 }

  attr_accessor :delete_photo

  before_validation { photo.clear if delete_photo == '1' }

  # ---------- CLASSES METHODS -----------------
  def self.filter_by_term(term)
    left_joins(organization_categories: :category)
    .where("LOWER(organizations.name) LIKE ? OR LOWER(categories.name) LIKE ?", "%#{term.downcase}%", "%#{term.downcase}%").group(:id)
  end
  # ---------- END CLASSES METHODS -------------

  # ---------- INSTANCE METHODS ----------------
  # ---------- END INSTANCE METHODS ------------

  private

  def validate_unique_team_categories
    validate_uniqueness_of_in_memory(team_categories, [:category_id, :team_id], 'Duplicate categories')
  end
end
