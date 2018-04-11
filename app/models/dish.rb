class Dish < ApplicationRecord
  # Direct associations

  belongs_to :bookmarks,
             :class_name => "Bookmark"

  has_one    :venue,
             :dependent => :destroy

  # Indirect associations

  # Validations

end
