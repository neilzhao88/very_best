class Dish < ApplicationRecord
  # Direct associations

  has_many   :venues,
             :dependent => :destroy

  has_many   :bookmarks,
             :dependent => :destroy

  # Indirect associations

  # Validations

end
