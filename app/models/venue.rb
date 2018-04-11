class Venue < ApplicationRecord
  # Direct associations

  has_many   :dishes,
             :dependent => :destroy

  has_many   :popular_dishes,
             :class_name => "Populardishlist",
             :dependent => :destroy

  # Indirect associations

  # Validations

end
