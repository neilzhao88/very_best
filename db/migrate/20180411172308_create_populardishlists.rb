class CreatePopulardishlists < ActiveRecord::Migration
  def change
    create_table :populardishlists do |t|
      t.integer :venue_id
      t.integer :bookmarks_id

      t.timestamps

    end
  end
end
