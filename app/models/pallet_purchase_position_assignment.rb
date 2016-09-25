class PalletPurchasePositionAssignment < ActiveRecord::Base
  belongs_to :pallet
  belongs_to :variant
end