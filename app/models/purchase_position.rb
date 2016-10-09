class PurchasePosition < ActiveRecord::Base
    belongs_to :purchase_order
    belongs_to :zip_location
    has_many :variants
    belongs_to :shipping_route
    belongs_to :commodity_code
end