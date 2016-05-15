class User < ActiveRecord::Base
  # Include default devise modules.
  devise :database_authenticatable, :validatable, :trackable,
    authentication_keys: [:phone]
  include DeviseTokenAuth::Concerns::User

  ACCOUNTABLES = [Shipper, Shop]

  USER_AUTO_UPDATE_PARAMS = [:latitude, :longitude]
  USER_PARAMS = [:phone, :password, :password_confirmation] + USER_AUTO_UPDATE_PARAMS

  belongs_to :accountable, polymorphic: true, dependent: :destroy
  # has_one :location

  before_save :sync_uid

  accepts_nested_attributes_for :accountable

  scope :online, ->{where status: true}

  scope :shipper, ->{online.where accountable_type: Shipper.name}

  scope :shop, ->{online.where accountable_type: Shop.name}

  scope :by_accountable_type, ->type{online.where accountable_type: type}

  User.class_eval do
    clear_validators!
    validates :phone, presence: true, uniqueness: true
  end

  def token_validation_response
    UserSerializer.new(self).as_json
  end

  protected
  def sync_uid
    self.uid = self.phone
  end
end
