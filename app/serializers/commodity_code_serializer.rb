class CommodityCodeSerializer < ActiveModel::Serializer
  attributes :id, :code, :title, :created_at, :updated_at
end
