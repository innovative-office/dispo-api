class RenameLevel3OnPallets < ActiveRecord::Migration
  def change
    rename_column :pallets, :level_3, :shipping_address_id
  end
end
