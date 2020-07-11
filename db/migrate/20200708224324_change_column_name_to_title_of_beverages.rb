# frozen_string_literal: true

# migration to change title attribute to name of beverages
class ChangeColumnNameToTitleOfBeverages < ActiveRecord::Migration[6.0]
  def change
    rename_column :beverages, :title, :name
  end
end
