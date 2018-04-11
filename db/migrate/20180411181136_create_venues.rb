class CreateVenues < ActiveRecord::Migration
  def change
    create_table :venues do |t|
      t.string :name
      t.string :neighborhood
      t.string :address
      t.integer :dish_id

      t.timestamps

    end
  end
end
