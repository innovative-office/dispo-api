class PalletSerializer < ActiveModel::Serializer
  attributes :id, :delivered, :mixed, :line_items_quantity
  has_many :purchase_positions
  has_many :purchase_orders
  has_many :line_items, serializer: LineItemSerializer
end
