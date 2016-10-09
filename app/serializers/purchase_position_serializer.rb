class PurchasePositionSerializer < ActiveModel::Serializer
  attributes :id, :baan_id, :created_at, :updated_at, :delivery_date, :available_quantity, :article, :article_number, :storage_location
  belongs_to :purchase_order
  belongs_to :zip_location
  belongs_to :shipping_route
  belongs_to :commodity_code
end
