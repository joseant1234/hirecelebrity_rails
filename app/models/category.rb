class Category < ApplicationRecord

  has_many :organization_categories, dependent: :destroy
  has_many :organization, through: :organization_categories
  
  enum status: [:active, :desactive]

end
