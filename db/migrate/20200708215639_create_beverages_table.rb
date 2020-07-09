class CreateBeveragesTable < ActiveRecord::Migration[6.0]
  def change
    create_table :beverages do |t|
      t.string :name
      t.references :user, null: false, foreign_key: true
    end
  end
end
