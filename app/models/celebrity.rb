class Celebrity < ApplicationRecord

  belongs_to :organization, optional: true
end
