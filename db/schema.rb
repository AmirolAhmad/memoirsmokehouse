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

ActiveRecord::Schema.define(version: 2021_06_09_021107) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "delivery_dates", force: :cascade do |t|
    t.date "date"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "status", default: 0, null: false
  end

  create_table "menus", force: :cascade do |t|
    t.string "default_picture"
    t.string "name"
    t.text "desription"
    t.string "weight"
    t.string "price"
    t.integer "status", default: 0, null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "order_menus", force: :cascade do |t|
    t.bigint "order_id", null: false
    t.bigint "menu_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "quantity"
    t.index ["menu_id"], name: "index_order_menus_on_menu_id"
    t.index ["order_id"], name: "index_order_menus_on_order_id"
  end

  create_table "orders", force: :cascade do |t|
    t.string "fullname"
    t.string "address1"
    t.string "address2"
    t.string "city"
    t.string "postcode"
    t.bigint "state_id", null: false
    t.string "phone_number"
    t.string "delivery_method"
    t.integer "status", default: 0, null: false
    t.decimal "total_price", precision: 8, scale: 2
    t.string "orderid"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "delivery_surcharge"
    t.boolean "paid", default: false
    t.string "promocode"
    t.text "note"
    t.bigint "delivery_date_id"
    t.index ["delivery_date_id"], name: "index_orders_on_delivery_date_id"
    t.index ["state_id"], name: "index_orders_on_state_id"
  end

  create_table "promocodes", force: :cascade do |t|
    t.string "code"
    t.datetime "expired_at"
    t.integer "status", default: 0, null: false
    t.integer "count", default: 0
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "value_percent"
    t.integer "fixed_amount"
    t.integer "limit", default: 100
    t.index ["code"], name: "index_promocodes_on_code", unique: true
  end

  create_table "states", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.integer "role", default: 0, null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "order_menus", "menus"
  add_foreign_key "order_menus", "orders"
  add_foreign_key "orders", "delivery_dates"
  add_foreign_key "orders", "states"
end
