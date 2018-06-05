class Video < ApplicationRecord
  include SortableConcern

  belongs_to :celebrity
  has_many :categories, through: :celebrity

  validates_presence_of :name
  validates :url, url: { allow_blank: false }
  validate :check_if_is_youtube_url

  before_validation :set_youtube_url

  # ---------- CLASSES METHODS -----------------
  def self.filter_by_featured
    where("videos.featured = ?",true)
  end

  # ---------- END CLASSES METHODS -------------

  # ---------- INSTANCE METHODS ----------------
  # ---------- END INSTANCE METHODS ------------

  private

  def check_if_is_youtube_url
    unless self.url.include? 'youtube.com' or self.url.include? 'youtu.be'
      errors.add(:url,'is invalid YouTube URL')
    end
  end

  def set_youtube_url
    if self.url.include? 'youtube.com' and !self.url.include? 'embed'
      url_array = self.url.split '/watch?v='
      self.url = "https://youtube.com/embed/#{url_array[1]}"
    elsif self.url.include? 'youtu.be'
      url_array = self.url.split 'youtu.be/'
      self.url = "https://youtube.com/embed/#{url_array[1]}"
    end
  end

end
