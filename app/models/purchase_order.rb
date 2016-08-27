class PurchaseOrder < ActiveRecord::Base
    has_many :purchase_positions
    belongs_to :shipping_route
    belongs_to :shipping_address, class_name: 'Address', foreign_key: 'level_3'
end