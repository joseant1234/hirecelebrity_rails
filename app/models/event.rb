class Event < ApplicationRecord

  include SortableConcern, PictureConcern

  belongs_to :celebrity
  has_many :event_services, dependent: :destroy
  has_many :categories, through: :celebrity
  has_many :services, through: :event_services

  accepts_nested_attributes_for :event_services, allow_destroy: true

  has_attached_file :photo, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/default.png"
  validates_attachment_content_type :photo, content_type: /\Aimage\/.*\z/

  validates_presence_of :title, :body
  validates :image_url, url: { allow_blank: true }
  validates :title, length: { maximum: 170 }
  validates :body, length: { maximum: 2000}
  validates :event_services, length: { minimum: 1 }
  validate :validate_unique_event_services

  attr_accessor :delete_photo

  before_validation { photo.clear if delete_photo == '1' }

  # ---------- CLASSES METHODS -----------------
  def self.filter_by_term(term)
    left_joins(event_services: :service).where("LOWER(events.title) LIKE ? OR LOWER(services.name) LIKE ?", "%#{term.downcase}%", "%#{term.downcase}%").group(:id)
  end
  # ---------- END CLASSES METHODS -------------

  private

  def validate_unique_event_services
    validate_uniqueness_of_in_memory(event_services, [:event_id, :service_id], 'Duplicate services')
  end
end
