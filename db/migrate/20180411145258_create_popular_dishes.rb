class CreatePopularDishes < ActiveRecord::Migration
  def change
    create_table :popular_dishes do |t|
      t.integer :venue_id
      t.integer :favorites_id

      t.timestamps

    end
  end
end
