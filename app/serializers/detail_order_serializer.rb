class DetailOrderSerializer < ApplicationSerializer
  attributes :id, :phone_shop, :phone_customer, :phone_shipper, :code, :code_checking, :status
end
