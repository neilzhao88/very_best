class Bucketlist < ApplicationRecord
  # Direct associations

  has_many   :bookmarks,
             :dependent => :destroy

  belongs_to :user

  # Indirect associations

  # Validations

end
