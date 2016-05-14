class Shipper < ActiveRecord::Base
  has_one :user, as: :accountable
  accepts_nested_attributes_for :user

  SHIPPER_PARAMS = [:money, :fee, :name, :address]

  scope :online, ->{joins(:user).merge User.online}
end
