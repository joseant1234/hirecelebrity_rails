class State < ApplicationRecord
  include SortableConcern

  validates_presence_of :name

  # ---------- CLASSES METHODS -----------------
  def self.except_other
    where.not("LOWER(name) = ?", 'other')
  end

  def self.only_other
    where("LOWER(name) = ?", 'other')
  end
  # ---------- END CLASSES METHODS -------------

  # ---------- INSTANCE METHODS ----------------
  # ---------- END INSTANCE METHODS ------------

end
