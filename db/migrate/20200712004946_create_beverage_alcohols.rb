# frozen_string_literal: true

# migration to create join table for beverages and alcohol
class CreateBeverageAlcohols < ActiveRecord::Migration[6.0]
  def change
    create_table :beverage_alcohols do |t|
      t.references :beverage, null: false, foreign_key: true
      t.references :alcohol, null: false, foreign_key: true
    end
  end
end
