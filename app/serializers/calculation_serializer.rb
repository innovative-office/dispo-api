class CalculationSerializer < ActiveModel::Serializer
  attributes :id, :total_pallets, :total_purchase_positions
  belongs_to :calculable, polymorphic: true
end
