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

ActiveRecord::Schema.define(version: 2021_05_06_153214) do

  create_table "businesses", force: :cascade do |t|
    t.string "name"
    t.integer "owner_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["owner_id"], name: "index_businesses_on_owner_id"
  end

  create_table "customers", force: :cascade do |t|
    t.string "full_name"
    t.string "first_name"
    t.string "last_name"
    t.string "company_name"
    t.string "avatar"
    t.string "email"
    t.string "phone_mobile"
    t.string "phone_home"
    t.string "address1"
    t.string "address2"
    t.string "city"
    t.string "state"
    t.integer "zip_code"
    t.string "country"
    t.integer "business_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["business_id"], name: "index_customers_on_business_id"
  end

  create_table "invoice_line_items", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.decimal "price"
    t.integer "invoice_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["invoice_id"], name: "index_invoice_line_items_on_invoice_id"
  end

  create_table "invoices", force: :cascade do |t|
    t.datetime "paid_date"
    t.datetime "due_date"
    t.datetime "canceled_date"
    t.integer "customer_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["customer_id"], name: "index_invoices_on_customer_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "business_name"
    t.string "avatar"
    t.string "email"
    t.boolean "blocked", default: false
    t.string "password_digest"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  add_foreign_key "businesses", "users", column: "owner_id"
  add_foreign_key "customers", "businesses"
  add_foreign_key "invoice_line_items", "invoices"
  add_foreign_key "invoices", "customers"
end
