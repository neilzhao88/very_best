class Venue < ApplicationRecord
  # Direct associations

  has_one    :popular_dish,
             :dependent => :destroy

  has_many   :dishes,
             :dependent => :destroy

  # Indirect associations

  # Validations

end
