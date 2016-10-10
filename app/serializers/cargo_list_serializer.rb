class CargoListSerializer < ActiveModel::Serializer
  attributes :id, :pick_up_time_earliest, :pick_up_time_latest, :created_at,
             :updated_at, :delivered, :referee, :country, :pallets_count,
             :eori, :tax_number, :delivery_city, :delivery_zip,
             :delivery_street, :delivery_country, :delivery_warehouse

  belongs_to :shipper
  has_many :pallets
  # :shipper_id, :shipper_location_id, :customer_id, :level_3
end
