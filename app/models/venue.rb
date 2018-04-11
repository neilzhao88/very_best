class Venue < ApplicationRecord
  # Direct associations

  has_many   :bookmarks,
             :dependent => :destroy

  belongs_to :dish,
             :required => false

  # Indirect associations

  # Validations

end
