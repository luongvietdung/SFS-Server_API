class CreateDetailOrder < ActiveRecord::Migration
  def change
    create_table :detail_orders do |t|
      t.references :user, index: true
      t.string :phone_shop, null: false
      t.string :phone_shipper, null: false
      t.string :code, null: false
      t.string :code_checking, null: false
      t.boolean :status, default: false
      t.timestamps null: false
    end
  end
end
