class PopularDish < ApplicationRecord
  # Direct associations

  belongs_to :venue

  belongs_to :favorites,
             :class_name => "Favorite"

  # Indirect associations

  # Validations

end
