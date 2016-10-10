class PalletSerializer < ActiveModel::Serializer
  attributes :id, :delivered, :mixed, :line_items_quantity, :additional_space
  has_many :purchase_positions
  has_many :purchase_orders
  has_many :line_items, serializer: LineItemSerializer
  belongs_to :pallet_type
  belongs_to :shipping_address, serializer: ShippingAddressSerializer
  belongs_to :shipping_route
  belongs_to :zip_location
end
