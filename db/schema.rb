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

ActiveRecord::Schema.define(version: 20160127042803) do

  create_table "alerts", force: :cascade do |t|
    t.string   "content",    limit: 255
    t.string   "user_id",    limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "catalogs", force: :cascade do |t|
    t.string   "name",           limit: 255
    t.string   "url",            limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "browse_node_id", limit: 255
  end

  create_table "coupons", force: :cascade do |t|
    t.string   "content",    limit: 255, null: false
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "flashdeals_tests", force: :cascade do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "merchants", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.string   "url",        limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "products", force: :cascade do |t|
    t.string   "name",                   limit: 255
    t.string   "description",            limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "detail_page_url",        limit: 255
    t.string   "manufacturer",           limit: 255
    t.integer  "list_price",             limit: 4
    t.string   "title",                  limit: 255
    t.string   "small_image_url",        limit: 255
    t.string   "medium_image_url",       limit: 255
    t.integer  "price",                  limit: 4
    t.integer  "amount_saved",           limit: 4
    t.integer  "percentage_saved",       limit: 4
    t.boolean  "is_supersaver_shipping"
    t.boolean  "is_prime"
    t.string   "ASIN",                   limit: 255
    t.integer  "merchant_id",            limit: 4
    t.integer  "catalog_id",             limit: 4
  end

  add_index "products", ["catalog_id"], name: "index_products_on_catalog_id", using: :btree
  add_index "products", ["merchant_id"], name: "index_products_on_merchant_id", using: :btree

  create_table "travel_sites", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.string   "url",        limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.string   "email",      limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "password",   limit: 255
  end

end
