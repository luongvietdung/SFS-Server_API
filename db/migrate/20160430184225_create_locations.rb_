class CreateLocations < ActiveRecord::Migration
  def change
    create_table :locations do |t|
      t.references :user, index: true
      t.decimal :latitude, precision: 15, scale: 10
      t.decimal :longitude, precision: 15, scale: 10
      t.timestamps null: false
    end
  end
end
