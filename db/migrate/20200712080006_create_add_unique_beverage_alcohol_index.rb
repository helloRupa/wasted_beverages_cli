# frozen_string_literal: true

# class to make all beverage alcohol joins unique
class CreateAddUniqueBeverageAlcoholIndex < ActiveRecord::Migration[6.0]
  def change
    add_index :beverage_alcohols, [:beverage_id, :alcohol_id], unique: true
  end
end
