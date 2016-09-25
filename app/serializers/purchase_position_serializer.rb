class PurchasePositionSerializer < ActiveModel::Serializer
  attributes :id, :baan_id, :created_at, :updated_at, :delivery_date, :available_quantity, :article, :article_number, :storage_location
  has_one :purchase_order
  has_one :zip_location
end
