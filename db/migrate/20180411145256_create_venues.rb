class CreateVenues < ActiveRecord::Migration
  def change
    create_table :venues do |t|
      t.string :name
      t.string :cuisine
      t.string :neighborhood
      t.string :address

      t.timestamps

    end
  end
end
