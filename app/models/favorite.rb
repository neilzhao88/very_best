class Favorite < ApplicationRecord
  # Direct associations

  belongs_to :dish

  has_many   :popular_dishes,
             :foreign_key => "favorites_id",
             :dependent => :destroy

  belongs_to :user

  # Indirect associations

  # Validations

end
