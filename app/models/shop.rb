class Shop < ActiveRecord::Base
  has_one :user, as: :accountable, dependent: :destroy
  accepts_nested_attributes_for :user

  SHOP_PARAMS = [:money, :product_name, :name, :address]
end
