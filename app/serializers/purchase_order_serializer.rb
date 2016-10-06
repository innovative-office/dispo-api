class PurchaseOrderSerializer < ActiveModel::Serializer
  attributes :id, :baan_id, :created_at, :updated_at, :delivery_date
  has_many :purchase_positions
  belongs_to :shipping_route
  belongs_to :shipping_address, serializer: ShippingAddressSerializer
  has_one :calculation
  has_many :pallets
end
