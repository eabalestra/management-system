# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.1].define(version: 2024_12_06_134619) do
  create_table "accounts", force: :cascade do |t|
    t.string "name"
    t.decimal "balance", precision: 11, scale: 2, default: "0.0"
    t.integer "account_type"
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_accounts_on_user_id"
  end

  create_table "clients", force: :cascade do |t|
    t.string "name"
    t.string "phone"
    t.string "dir"
    t.string "email"
    t.string "city"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "products", force: :cascade do |t|
    t.string "code", null: false
    t.string "name", null: false
    t.text "description"
    t.string "image_url"
    t.integer "stock_quantity", default: 0
    t.date "last_price_update"
    t.date "last_stock_update"
    t.decimal "unit_cost", precision: 11, scale: 2, null: false
    t.decimal "unit_price", precision: 11, scale: 2, null: false
    t.decimal "tax_amount", precision: 11, scale: 2, null: false
    t.decimal "profit_margin", precision: 11, scale: 2, default: "0.0"
    t.integer "supplier_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["supplier_id"], name: "index_products_on_supplier_id"
  end

  create_table "suppliers", force: :cascade do |t|
    t.string "name"
    t.string "phone"
    t.string "dir"
    t.string "email"
    t.string "city"
    t.string "website"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "transactions", force: :cascade do |t|
    t.decimal "amount", precision: 11, scale: 2, default: "0.0"
    t.integer "transaction_type"
    t.integer "source_account_id"
    t.integer "destination_account_id"
    t.string "description"
    t.datetime "timestamp"
    t.integer "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["destination_account_id"], name: "index_transactions_on_destination_account_id"
    t.index ["source_account_id"], name: "index_transactions_on_source_account_id"
    t.index ["user_id"], name: "index_transactions_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "role", default: 0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "accounts", "users"
  add_foreign_key "products", "suppliers"
  add_foreign_key "transactions", "accounts", column: "destination_account_id"
  add_foreign_key "transactions", "accounts", column: "source_account_id"
  add_foreign_key "transactions", "users"
end
