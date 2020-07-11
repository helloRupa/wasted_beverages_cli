# frozen_string_literal: true

# migration to add strength attribute to beverages
class AddStrengthToBeverages < ActiveRecord::Migration[6.0]
  def change
    add_column :beverages, :strength, :integer
  end
end
