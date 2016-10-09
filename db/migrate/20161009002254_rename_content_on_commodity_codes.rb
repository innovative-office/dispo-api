class RenameContentOnCommodityCodes < ActiveRecord::Migration
  def change
    rename_column :commodity_codes, :content, :title
  end
end
