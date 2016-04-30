class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :phone, null: false, unique: true
      t.boolean :status, default: false
      t.references :accountable, polymorphic: true, index: true
      t.timestamps null: false
    end
  end
end
