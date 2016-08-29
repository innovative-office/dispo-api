class PurchasePosition < ActiveRecord::Base
    belongs_to :purchase_order
    belongs_to :zip_location
end