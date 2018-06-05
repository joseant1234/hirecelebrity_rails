class BookingTopic < ApplicationRecord

  include SortableConcern, PictureConcern

  has_many :booking_topic_categories, dependent: :destroy
  has_many :categories, through: :booking_topic_categories

  enum status: [:active, :desactive]

  accepts_nested_attributes_for :booking_topic_categories, allow_destroy: true

  has_attached_file :photo, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/default.png"
  validates_attachment_content_type :photo, content_type: /\Aimage\/.*\z/

  validates_presence_of :title
  validates :title, length: { maximum: 170 }
  validates :image_url, url: { allow_blank: true }
  validate :validate_unique_booking_topic_categories

  attr_accessor :delete_photo

  before_validation { photo.clear if delete_photo == '1' }

  # ---------- CLASSES METHODS -------------
  def self.filter_by_term(term)
    left_joins(booking_topic_categories: :category)
    .where("LOWER(booking_topics.title) LIKE ? OR LOWER(categories.name) LIKE ?", "%#{term.downcase}%", "%#{term.downcase}%").group(:id)
  end

  def self.filter_by_popular
    where("popular = ?", true)
  end

  # ---------- END CLASSES METHODS -------------

  # ---------- INSTANCE METHODS ----------------
  # ---------- END INSTANCE METHODS ------------


  private

  def validate_unique_booking_topic_categories
    validate_uniqueness_of_in_memory(booking_topic_categories, [:category_id, :booking_topic_id], 'Duplicate categories')
  end
  
end
