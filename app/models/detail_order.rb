class DetailOrder < ActiveRecord::Base
  belongs_to :user, ->{where(accountable_type: Shop.name)}, class_name: User
end
