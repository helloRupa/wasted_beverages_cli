# frozen_string_literal: true

# migration to create users table
class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.string :username
    end
  end
end
