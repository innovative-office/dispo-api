class PurchaseOrderPalletAssignment < ActiveRecord::Base
  belongs_to :purchase_order
  belongs_to :pallet
end