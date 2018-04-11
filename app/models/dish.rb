class Dish < ApplicationRecord
  # Direct associations

  belongs_to :venue,
             :required => false

  has_many   :bookmarks,
             :dependent => :destroy

  # Indirect associations

  # Validations

end
