class Photograph < ApplicationRecord
  include SortableConcern, PictureConcern

   belongs_to :site

   enum section: [:who_we_are,:banner]

   has_attached_file :photo, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/default.png"
   validates_attachment_content_type :photo, content_type: /\Aimage\/.*\z/

   validates_presence_of :title, :section
   validates :image_url, url: { allow_blank: true }
   validates :title, length: { maximum: 100 }
   validates :subtitle, :url, length: { maximum: 200 }
   validate :should_have_image_url_or_photo
   validate :count_of_images_for_who_we_are, on: :create
   validate :count_of_images_for_banner, on: :create

   attr_accessor :delete_photo

   before_validation { photo.clear if delete_photo == '1' }
   before_create :clear_subtitle, on: :create

   MAX_IMAGE_PER_BANNER = 3
   MAX_IMAGE_PER_WHO_ARE = 18

   private
   def should_have_image_url_or_photo
     if !self.image_url.present? and !self.photo.present?
       errors.add(:base,'Should enter image URL or upload file')
     end
   end

   def count_of_images_for_who_we_are
     if self.section == "who_we_are" and self.site.photographs.who_we_are.count >= Photograph::MAX_IMAGE_PER_WHO_ARE
       errors.add(:base,"Images are too long(maximum is 18 photos)")
     end
   end

   def count_of_images_for_banner
     if self.section == "banner" and self.site.photographs.banner.count >= Photograph::MAX_IMAGE_PER_BANNER
       errors.add(:base,"Images are too long(maximum is 3 photos)")
     end
   end

   def clear_subtitle
     self.subtitle = nil if self.section == "who_we_are"
   end

end
