class Pallet < ActiveRecord::Base
    has_many :purchase_order_pallet_assignments, dependent: :destroy
    has_many :purchase_orders, through: :purchase_order_pallet_assignments
    
    has_many :line_items, class_name: "PalletPurchasePositionAssignment", dependent: :destroy
    has_many :pallet_purchase_position_assignments

    has_many :variants, through: :pallet_purchase_position_assignments
    has_many :purchase_positions, through: :variants

    belongs_to :pallet_type
    belongs_to :shipping_address, class_name: 'Address', foreign_key: 'shipping_address_id'
    belongs_to :shipping_route
    belongs_to :zip_location

    attr_accessor :selected
end