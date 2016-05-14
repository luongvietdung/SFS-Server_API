class Shop < ActiveRecord::Base
  has_one :user, as: :accountable
  accepts_nested_attributes_for :user

  SHOP_PARAMS = [:money, :product_name, :name, :address]

  scope :online, ->{joins(:user).merge User.online}

  def shop_response
    UserSerializer.new(user).as_json
  end
end
