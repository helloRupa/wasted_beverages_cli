# frozen_string_literal: true

# migration to create alcohols table
class CreateAlcohols < ActiveRecord::Migration[6.0]
  def change
    create_table :alcohols do |t|
      t.string :kind
    end
  end
end
