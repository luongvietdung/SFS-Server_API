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

ActiveRecord::Schema.define(version: 20160520164402) do

  create_table "detail_orders", force: :cascade do |t|
    t.integer  "user_id",        limit: 4
    t.string   "phone_customer", limit: 255,                 null: false
    t.string   "phone_shop",     limit: 255,                 null: false
    t.string   "phone_shipper",  limit: 255,                 null: false
    t.string   "code",           limit: 255,                 null: false
    t.string   "code_checking",  limit: 255,                 null: false
    t.boolean  "status",                     default: false
    t.datetime "created_at",                                 null: false
    t.datetime "updated_at",                                 null: false
  end

  add_index "detail_orders", ["user_id"], name: "index_detail_orders_on_user_id", using: :btree

  create_table "shippers", force: :cascade do |t|
    t.decimal  "money",                    precision: 10, scale: 2
    t.decimal  "fee",                      precision: 10, scale: 2
    t.string   "name",       limit: 255
    t.text     "address",    limit: 65535
    t.integer  "user_id",    limit: 4
    t.datetime "created_at",                                        null: false
    t.datetime "updated_at",                                        null: false
  end

  add_index "shippers", ["user_id"], name: "index_shippers_on_user_id", using: :btree

  create_table "shops", force: :cascade do |t|
    t.decimal  "money",                      precision: 10, scale: 2
    t.string   "product_name", limit: 255
    t.string   "name",         limit: 255
    t.text     "address",      limit: 65535
    t.integer  "user_id",      limit: 4
    t.datetime "created_at",                                          null: false
    t.datetime "updated_at",                                          null: false
  end

  add_index "shops", ["user_id"], name: "index_shops_on_user_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "provider",           limit: 255,   default: "email", null: false
    t.string   "uid",                limit: 255,   default: "",      null: false
    t.string   "encrypted_password", limit: 255,   default: "",      null: false
    t.integer  "sign_in_count",      limit: 4,     default: 0,       null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip", limit: 255
    t.string   "last_sign_in_ip",    limit: 255
    t.string   "phone",              limit: 255,                     null: false
    t.boolean  "status",                           default: false
    t.integer  "accountable_id",     limit: 4
    t.string   "accountable_type",   limit: 255
    t.text     "tokens",             limit: 65535
    t.datetime "created_at",                                         null: false
    t.datetime "updated_at",                                         null: false
    t.float    "latitude",           limit: 24,    default: 0.0
    t.float    "longitude",          limit: 24,    default: 0.0
  end

  add_index "users", ["accountable_type", "accountable_id"], name: "index_users_on_accountable_type_and_accountable_id", using: :btree
  add_index "users", ["phone"], name: "index_users_on_phone", using: :btree
  add_index "users", ["status"], name: "index_users_on_status", using: :btree
  add_index "users", ["uid", "provider"], name: "index_users_on_uid_and_provider", unique: true, using: :btree

end
