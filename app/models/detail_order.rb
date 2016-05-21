class DetailOrder < ActiveRecord::Base
  belongs_to :user, ->{where(accountable_type: Shop.name)}, class_name: User

  PARAMS_CREATABLE = [:phone_shop, :phone_shipper, :code, :code_checking]

  scope :by_user, ->user_id{where user_id: user_id}
  scope :created_at,->{where created_at: Time.zone.today.beginning_of_day..Time.zone.today.end_of_day}

  class << self
    def generate_code user
      "#{Time.zone.today.strftime('%Y%m%d')}#{1 + created_at.by_user(user.try(:id)).count}"
    end
  end
end
