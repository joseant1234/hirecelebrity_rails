class Site < ApplicationRecord
  include AASM

  belongs_to :admin
  has_many :site_categories, dependent: :destroy
  has_many :categories, through: :site_categories
  has_many :photographs, dependent: :destroy
  has_many :booking_requests, dependent: :destroy
  has_many :celebrities, ->{ group(:id) }, through: :site_categories

  enum status: [:active, :desactive]

  enum banner_option: [:featured_celebrities, :general_image]

  accepts_nested_attributes_for :site_categories, allow_destroy: true

  validates :name, :url, :phone, :who_we_are, :general_service, :banner_option, :terms_and_conditions, presence: true
  validates :image_logo_url, url: { allow_blank: true }
  validates :who_we_are, length: { maximum: 500 }
  validates :general_service, :terms_and_conditions, :footer, length: { maximum: 2000 }
  validates :name, :url, :facebook_url, :twitter_url, length: { maximum: 50 }
  validates :facebook_url, :twitter_url, url: { allow_blank: true }
  validates :site_categories, length: { minimum: 1 }
  validate :validate_unique_site_categories

  has_attached_file :logo, default_url: "/images/default.png"
  validates_attachment_content_type :logo, content_type: /\Aimage\/.*\z/

  attr_accessor :delete_logo

  before_validation { logo.clear if delete_logo == '1' }
  before_validation :set_facebook_or_twitter_url
  before_validation :set_domain
  before_update :check_if_is_featured_to_desactive

  aasm :column => :state do
    state :created, :initial => true
    state :featured

    event :feature do
      before do
        Site.featured.each do |site|
          site.unfeature!
        end
        self.status = "active"
      end
      after do
        self.update(categories: Category.all)
      end
      transitions from: :created, to: :featured
    end

    event :unfeature do
      transitions from: :featured, to: :created
    end
  end

  # ---------- CLASSES METHODS -----------------
  def self.filter_by_term(term)
    left_joins(site_categories: :category).where("LOWER(sites.name) LIKE ? OR LOWER(categories.name) LIKE ?", "%#{term.downcase}%", "%#{term.downcase}%").group(:id)
  end

  # ---------- END CLASSES METHODS -------------

  # ---------- INSTANCE METHODS ----------------
  # ---------- END INSTANCE METHODS ------------

  private
  def set_facebook_or_twitter_url
    if self.facebook_url.present? and !facebook_url.include? 'http'
      self.facebook_url = "http://#{facebook_url}"
    end

    if self.twitter_url.present? and !twitter_url.include? 'http'
      self.twitter_url = "http://#{twitter_url}"
    end
  end

  def validate_unique_site_categories
    validate_uniqueness_of_in_memory(site_categories, [:category_id, :site_id], 'Duplicate categories')
  end

  def check_if_is_featured_to_desactive
    if self.featured? and self.status_was == "active" and self.status == "desactive"
      errors.add(:state, 'feature can not be delete')
      throw :abort
      return false
    end
  end

  def set_domain
    return self.url.remove!('http://' ) if self.url.include? 'http' and !self.url.include? 'https'
    return self.url.remove!('https://' ) if self.url.include? 'https'
  end
end
