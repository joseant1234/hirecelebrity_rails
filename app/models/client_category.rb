class ClientCategory < ApplicationRecord
  belongs_to :client
  belongs_to :category

  # ---------- CLASSES METHODS -----------------
  # ---------- END CLASSES METHODS -------------

  # ---------- INSTANCE METHODS ----------------
  # ---------- END INSTANCE METHODS ------------
end
