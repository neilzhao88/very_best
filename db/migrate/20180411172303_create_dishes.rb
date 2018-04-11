class CreateDishes < ActiveRecord::Migration
  def change
    create_table :dishes do |t|
      t.string :name
      t.integer :bookmarks_id
      t.integer :venue_id

      t.timestamps

    end
  end
end