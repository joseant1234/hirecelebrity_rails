class ServiceCategory < ApplicationRecord
  belongs_to :service
  belongs_to :category, counter_cache: true
end
