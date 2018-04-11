class Bookmark < ApplicationRecord
  # Direct associations

  has_one    :dish,
             :foreign_key => "bookmarks_id",
             :dependent => :destroy

  belongs_to :bucketlist

  # Indirect associations

  # Validations

end
