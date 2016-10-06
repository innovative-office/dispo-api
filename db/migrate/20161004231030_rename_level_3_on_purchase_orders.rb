class RenameLevel3OnPurchaseOrders < ActiveRecord::Migration
  def change
    rename_column :purchase_orders, :level_3, :shipping_address_id
  end
end
