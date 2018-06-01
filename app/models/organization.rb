class Organization < ApplicationRecord
  has_many :organization_categories
  has_many :celebrities, through: :organization_categories

  accepts_nested_attributes_for :organization_categories, allow_destroy: true

  has_attached_file :photo, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/default.png"
  validates_attachment_content_type :photo, content_type: /\Aimage\/.*\z/

end
