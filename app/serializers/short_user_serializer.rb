class ShortUserSerializer < ApplicationSerializer
  attributes :id, :phone, :status, :accountable_id, :accountable_type, :latitude, :longitude
end
