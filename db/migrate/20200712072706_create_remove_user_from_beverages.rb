# frozen_string_literal: true

# migration to remove user reference from beverages
class CreateRemoveUserFromBeverages < ActiveRecord::Migration[6.0]
  def change
    remove_column :beverages, :user_id
  end
end
