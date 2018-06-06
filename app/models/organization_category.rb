class OrganizationCategory < ApplicationRecord

  belongs_to :organization
  belongs_to :category, counter_cache: true
  
end
