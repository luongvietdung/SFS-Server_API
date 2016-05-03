class Location < ActiveRecord::Base
  belongs_to :user

  LOCATION_PARAMS = [:latitude, :longitude]

  scope :locations, ->type{joins(:user).merge User.by_accountable_type type}
end
