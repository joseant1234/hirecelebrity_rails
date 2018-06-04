module PictureConcern extend ActiveSupport::Concern

  def portrait
    self.image_url.presence || self.photo.url
  end
end
