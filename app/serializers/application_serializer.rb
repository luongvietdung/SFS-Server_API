class ApplicationSerializer < ActiveModel::Serializer
  root false
  format_keys :lower_camel
end
