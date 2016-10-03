class VariantSerializer < ActiveModel::Serializer
  attributes :id, :weight_single, :weight_total, :amount, :total_amount, :gross_price, :net_price, :value_discount, :created_at, :updated_at, :volume
  
  has_one :purchase_position
end
