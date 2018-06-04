class CelebrityCategory < ApplicationRecord
  belongs_to :celebrity
  belongs_to :category
end
