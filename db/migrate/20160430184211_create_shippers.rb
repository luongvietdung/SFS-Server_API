class CreateShippers < ActiveRecord::Migration
  def change
    create_table :shippers do |t|
      t.decimal :money, precision: 5, scale: 2
      t.decimal :fee, precision: 5, scale: 2
      t.string :name
      t.text :address
      t.references :user, index: true
      t.timestamps null: false
    end
  end
end
