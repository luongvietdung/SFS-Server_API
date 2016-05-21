class CreateDetailOrder < ActiveRecord::Migration
  def change
    create_table :detail_orders do |t|
      t.references :users, index: true
      t.string :phone_shop, null: false
      t.string :phone_shipper, null: false
      t.string :code, null: false
      t.string :code_checking, null: false
      t.boolean :status, default: false
      t.timestamp null: false
    end
  end
end
