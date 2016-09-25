class PurchaseOrder < ActiveRecord::Base
  has_many :purchase_positions
  belongs_to :shipping_route
  belongs_to :shipping_address, class_name: 'Address', foreign_key: 'level_3'
  has_one :calculation, as: :calculable, dependent: :destroy
  has_many :zip_locations, through: :purchase_positions

  has_many :purchase_order_pallet_assignments
  has_many :pallets, through: :purchase_order_pallet_assignments
end