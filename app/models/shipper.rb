class Shipper < ActiveRecord::Base
  has_one :user, as: :accountable, dependent: :destroy
  accepts_nested_attributes_for :user

  SHIPPER_PARAMS = [:money, :fee, :name, :address]
end
