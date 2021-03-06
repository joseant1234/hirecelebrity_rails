class Celebrity < ApplicationRecord

  include SortableConcern, PictureConcern, SitesConcern

  belongs_to :state
  belongs_to :organization, optional: true
  has_many :celebrity_categories, dependent: :destroy
  has_many :categories, through: :celebrity_categories
  has_many :testimonials, as: :resource, dependent: :destroy
  has_many :events, dependent: :destroy
  has_many :videos, dependent: :destroy
  has_many :booking_requests, dependent: :destroy

  enum status: [:active, :desactive]

  accepts_nested_attributes_for :celebrity_categories, allow_destroy: true

  has_attached_file :photo, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/default.png"
  validates_attachment_content_type :photo, content_type: /\Aimage\/.*\z/

  validates_presence_of :name, :last_name, :biography, :fee_min, :mini_description, :disclaimer
  validates :name, :last_name, length: { maximum: 50 }
  validates :biography, length: { maximum: 2000}
  validates :mini_description, length: { maximum: 60}
  validates :image_url, url: { allow_blank: true }
  validates :disclaimer, length: { maximum: 500}
  validates :celebrity_categories, length: { minimum: 1 }
  validate :validate_unique_celebrity_categories

  attr_accessor :delete_photo, :fee_range

  before_validation { photo.clear if delete_photo == '1' }
  before_validation :set_fee_min_and_fee_max

  FEE_RANGES = ["$2,000 - $5,000","$5,000 - $10,000","$10,000 - $20,000","$20,000 - $30,000","$30,000 - $50,000","$50,000 - $100,000","$100,000 - $200,000","$200,000 +"].freeze

  # ---------- CLASSES METHODS -------------
  def self.filter_by_term(term)
    left_joins(celebrity_categories: :category)
    .left_joins(:organization)
    .where("LOWER(celebrities.name) LIKE ? OR LOWER(celebrities.last_name) LIKE ? OR LOWER(categories.name) LIKE ? OR LOWER(organizations.name) LIKE ?", "%#{term.downcase}%", "%#{term.downcase}%", "%#{term.downcase}%", "%#{term.downcase}%").group(:id)
  end

  def self.filter_by_featured
    where("celebrities.featured = ?", true)
  end


  # ---------- END CLASSES METHODS --------------

  # ---------- INSTANCE METHODS -----------------
  def display_full_name
    "#{self.name} #{self.last_name}"
  end
  # ---------- END INSTANCE METHODS -------------
  private

  def validate_unique_celebrity_categories
    validate_uniqueness_of_in_memory(celebrity_categories, [:category_id, :celebrity_id], 'Duplicate categories')
  end

  def set_fee_min_and_fee_max
    if self.fee_range.present?
      fee_range_array = self.fee_range.split(/[+-]/)
      self.fee_min = fee_range_array[0].try(:remove,/[$,' ']/).try(:to_i)
      self.fee_max = fee_range_array[1].try(:remove,/[$,' ']/).try(:to_i)
    end
  end

end
