class DetailOrder < ActiveRecord::Base
  belongs_to :user, ->{where(accountable_type: Shop.name)}, class_name: User

  PARAMS_CREATABLE = [:phone_customer, :phone_shipper, :code, :code_checking]

  scope :by_user, ->user_id{where user_id: user_id}
  scope :created_at,->{where created_at: Time.zone.today.beginning_of_day..Time.zone.today.end_of_day}

  before_save :save_phone_shop

  class << self
    def generate_code user
      "#{Time.zone.today.strftime('%Y%m%d')}#{1 + created_at.by_user(user.try(:id)).count}"
    end
  end

  private
  def save_phone_shop
    self.phone_shop = self.user.phone
  end
end
