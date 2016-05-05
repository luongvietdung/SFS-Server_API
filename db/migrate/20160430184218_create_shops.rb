class CreateShops < ActiveRecord::Migration
  def change
    create_table :shops do |t|
      t.decimal :money, precision: 10, scale: 2
      t.string :product_name
      t.string :name
      t.text :address
      t.references :user, index: true
      t.timestamps null: false
    end
  end
end
