class LineItemSerializer < ActiveModel::Serializer
  type :line_items

  attributes :id, :quantity, :created_at, :updated_at, :amount, :weight, :reduced_price, :gross_price, :net_price, :value_discount, :is_individual_package
  
  has_one :variant
  has_one :pallet
end
