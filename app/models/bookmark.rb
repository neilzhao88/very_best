class Bookmark < ApplicationRecord
  # Direct associations

  belongs_to :bucketlist

  belongs_to :dish

  # Indirect associations

  # Validations

end
