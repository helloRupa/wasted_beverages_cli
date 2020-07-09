class ChangeColumnNameToTitleOfBeverages < ActiveRecord::Migration[6.0]
  def change
    rename_column :beverages, :name, :title
  end
end
