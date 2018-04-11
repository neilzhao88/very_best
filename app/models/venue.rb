class Venue < ApplicationRecord
  # Direct associations

  has_many   :popular_dishes,
             :class_name => "Populardishlist",
             :dependent => :destroy

  belongs_to :dish

  # Indirect associations

  # Validations

end
