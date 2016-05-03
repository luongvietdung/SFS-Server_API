class User < ActiveRecord::Base
  ACCOUNTABLES = [Shipper, Shop]

  USER_PARAMS = [:phone]

  belongs_to :accountable, polymorphic: true, dependent: :destroy,
    required: true, autosave: true
  has_one :location, dependent: :destroy

  accepts_nested_attributes_for :accountable

  validates :phone, uniqueness: true

  scope :online, ->{where status: true}

  scope :shipper, ->{online.where accountable_type: Shipper.name}

  scope :shop, ->{online.where accountable_type: Shop.name}

  scope :by_accountable_type, ->type{online.where accountable_type: type}
end
