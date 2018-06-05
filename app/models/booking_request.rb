class BookingRequest < ApplicationRecord

  belongs_to :service
  belongs_to :celebrity, optional: true
  belongs_to :site

  enum status: [:active, :desactive]

  validates :name, :phone, :company, :event_location, :event_date, presence: true
  validates_presence_of :celebrity, if: :is_booking_request?
  validates_email_format_of :email
  validates :phone, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validates :budget, numericality: { greater_than: 0 }
  validate :event_date_has_to_be_greather_or_equal_than_now, on: :create

  # ---------- CLASSES METHODS -----------------
  def self.filter_by_term(term)
    where("LOWER(booking_requests.name) LIKE ? OR LOWER(booking_requests.email) LIKE ? OR LOWER(booking_requests.phone) LIKE ?", "%#{term.downcase}%", "%#{term.downcase}%", "%#{term.downcase}%").group(:id)
  end
  # ---------- END CLASSES METHODS -------------

  # ---------- INSTANCE METHODS ----------------
   def is_booking_request?
    self.celebrity_id.present?
  end
  # ---------- END INSTANCE METHODS ------------
  private

  def event_date_has_to_be_greather_or_equal_than_now
    if !self.event_date || self.event_date < Time.now.to_date
      errors.add(:event_date, "has to be equal or more that #{Time.now.to_date.to_s}")
    end
  end
end
