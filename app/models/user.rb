class User < ActiveRecord::Base
  ACCOUNTABLES = [Shipper, Shop]

  belongs_to :accountable, polymorphic: true, dependent: :destroy,
    required: true, autosave: true
  has_one :location, dependent: :destroy

  accepts_nested_attributes_for :accountable

  validates :phone, uniqueness: true
end
