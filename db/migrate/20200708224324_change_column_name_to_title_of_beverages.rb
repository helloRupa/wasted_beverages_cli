class ChangeColumnNameToTitleOfBeverages < ActiveRecord::Migration[6.0]
  def change
    rename_column :beverages, :title, :name
  end
end
