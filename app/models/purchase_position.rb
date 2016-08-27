class PurchasePosition < ActiveRecord::Base
    belongs_to :purchase_order
end