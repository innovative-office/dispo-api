class ShippingAddressSerializer < ActiveModel::Serializer
  type :shipping_addresses
  attributes :id, :consignee_full
  
  def consignee_full
    "#{object.company_name}, #{object.street}, #{object.country}-#{object.postal_code} #{object.city}"
  end
  
end
