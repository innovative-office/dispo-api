class PalletTypeSerializer < ActiveModel::Serializer
  attributes :id, :description, :count_as, :read_as, :weight
end
