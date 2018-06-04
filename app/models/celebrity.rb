class Celebrity < ApplicationRecord

  belongs_to :state
  belongs_to :organization, optional: true
  has_many :celebrity_categories
  has_many :categories, through: :celebrity_categories

  enum status: [:active, :desactive]

  accepts_nested_attributes_for :celebrity_categories, allow_destroy: true

  has_attached_file :photo, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/default.png"
  validates_attachment_content_type :photo, content_type: /\Aimage\/.*\z/

  attr_accessor :delete_photo, :fee_range

  before_validation :set_fee_min_and_fee_max

  FEE_RANGES = ["$2,000 - $5,000","$5,000 - $10,000","$10,000 - $20,000","$20,000 - $30,000","$30,000 - $50,000","$50,000 - $100,000","$100,000 - $200,000","$200,000 +"].freeze

  # ---------- CLASSES METHODS -------------
  def self.filter_by_term(term)
    left_joins(celebrity_categories: :category)
    .left_joins(:organization)
    .where("LOWER(celebrities.name) LIKE ? OR LOWER(celebrities.last_name) LIKE ? OR LOWER(categories.name) LIKE ? OR LOWER(organizations.name) LIKE ?", "%#{term.downcase}%", "%#{term.downcase}%", "%#{term.downcase}%", "%#{term.downcase}%").group(:id)
  end
  # ---------- END CLASSES METHODS --------------

  # ---------- INSTANCE METHODS -----------------
  # ---------- END INSTANCE METHODS -------------
  private

  def set_fee_min_and_fee_max
    if self.fee_range.present?
      fee_range_array = self.fee_range.split(/[+-]/)
      self.fee_min = fee_range_array[0].try(:remove,/[$,' ']/).try(:to_i)
      self.fee_max = fee_range_array[1].try(:remove,/[$,' ']/).try(:to_i)
    end
  end

end
