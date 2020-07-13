# frozen_string_literal: true

# class to make all user beverage joins unique
class CreateAddUniqueUserBeverageIndex < ActiveRecord::Migration[6.0]
  def change
    add_index :user_beverages, [:user_id, :beverage_id], unique: true
  end
end
