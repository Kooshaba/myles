# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20151025025930) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"
  enable_extension "hstore"

  create_table "addresses", force: :cascade do |t|
    t.string   "address1"
    t.string   "address2"
    t.string   "city"
    t.string   "state"
    t.string   "zip"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.integer  "recipient_id"
  end

  add_index "addresses", ["recipient_id"], name: "index_addresses_on_recipient_id", using: :btree

  create_table "billing_details", force: :cascade do |t|
    t.integer  "user_id"
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
    t.string   "simplify_token"
    t.string   "simplify_customer_id"
    t.integer  "card_last_four_digits"
    t.integer  "card_exp_month"
    t.integer  "card_exp_year"
    t.string   "card_type"
  end

  add_index "billing_details", ["user_id"], name: "index_billing_details_on_user_id", using: :btree

  create_table "categories", force: :cascade do |t|
    t.string   "name"
    t.string   "image_url"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "items", force: :cascade do |t|
    t.string   "name"
    t.string   "description"
    t.integer  "price"
    t.string   "image_url"
    t.integer  "category_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "items", ["category_id"], name: "index_items_on_category_id", using: :btree

  create_table "orders", force: :cascade do |t|
    t.integer  "shipment_id"
    t.integer  "item_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.integer  "recipient_id"
  end

  add_index "orders", ["item_id"], name: "index_orders_on_item_id", using: :btree
  add_index "orders", ["recipient_id"], name: "index_orders_on_recipient_id", using: :btree
  add_index "orders", ["shipment_id"], name: "index_orders_on_shipment_id", using: :btree

  create_table "recipients", force: :cascade do |t|
    t.string   "first_name", null: false
    t.string   "last_name",  null: false
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "recipients", ["user_id"], name: "index_recipients_on_user_id", using: :btree

  create_table "shipments", force: :cascade do |t|
    t.datetime "shipped_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.hstore   "roles"
    t.string   "first_name",                          null: false
    t.string   "last_name",                           null: false
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  add_foreign_key "billing_details", "users"
  add_foreign_key "items", "categories"
  add_foreign_key "orders", "items"
end
