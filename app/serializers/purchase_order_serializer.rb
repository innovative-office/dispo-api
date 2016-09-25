class PurchaseOrderSerializer < ActiveModel::Serializer
  attributes :id, :baan_id, :created_at, :updated_at, :delivery_date
  has_many :purchase_positions
  has_one :shipping_route
  has_one :shipping_address, serializer: ShippingAddressSerializer
  has_one :calculation
  has_many :pallets
end
