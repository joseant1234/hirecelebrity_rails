class SiteCategory < ApplicationRecord
  belongs_to :site
  belongs_to :category, counter_cache: true
  has_many :celebrities, through: :category

  # ---------- CLASSES METHODS -----------------
  # ---------- END CLASSES METHODS -------------

  # ---------- INSTANCE METHODS ----------------
  # ---------- END INSTANCE METHODS ------------
end
