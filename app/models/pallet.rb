class Pallet < ActiveRecord::Base
    has_many :purchase_order_pallet_assignments
    has_many :purchase_orders, through: :purchase_order_pallet_assignments, dependent: :destroy
    
    has_many :line_items, class_name: "PalletPurchasePositionAssignment"
    has_many :pallet_purchase_position_assignments

    has_many :variants, through: :pallet_purchase_position_assignments
    has_many :purchase_positions, through: :variants

    attr_accessor :selected
end