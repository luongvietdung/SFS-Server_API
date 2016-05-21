class DetailOrderSerializer < ApplicationSerializer
  attributes :id, :phone_shop, :phone_customer, :phone_shipper, :code, :code_checking, :status, :date

  def date
    object.created_at.to_date
  end
end
