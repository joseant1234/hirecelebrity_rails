class SiteCategory < ApplicationRecord
  belongs_to :site
  belongs_to :category

  # ---------- CLASSES METHODS -----------------
  # ---------- END CLASSES METHODS -------------

  # ---------- INSTANCE METHODS ----------------
  # ---------- END INSTANCE METHODS ------------
end
