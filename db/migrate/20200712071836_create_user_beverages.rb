# frozen_string_literal: true

# migration to create join table for users and beverages
class CreateUserBeverages < ActiveRecord::Migration[6.0]
  def change
    create_table :user_beverages do |t|
      t.references :user, null: false, foreign_key: true
      t.references :beverage, null: false, foreign_key: true
    end
  end
end
