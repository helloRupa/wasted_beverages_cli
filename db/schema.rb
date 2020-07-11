# frozen_string_literal: true

ActiveRecord::Schema.define(version: 2020_07_08_224324) do
  create_table "beverages", force: :cascade do |t|
    t.string "name"
    t.integer "user_id", null: false
    t.integer "strength"
    t.index ["user_id"], name: "index_beverages_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "username"
  end

  add_foreign_key "beverages", "users"
end
