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

ActiveRecord::Schema.define(version: 20151128204215) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "groups", force: :cascade do |t|
    t.string   "title"
    t.text     "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "rolls", force: :cascade do |t|
    t.string   "suffix"
    t.string   "location"
    t.text     "comment"
    t.integer  "textile_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "rolls", ["textile_id"], name: "index_rolls_on_textile_id", using: :btree

  create_table "textiles", force: :cascade do |t|
    t.string   "code"
    t.string   "name"
    t.string   "country"
    t.string   "manufacturer"
    t.string   "man_code"
    t.string   "units"
    t.integer  "height"
    t.integer  "price"
    t.integer  "group_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  add_index "textiles", ["code"], name: "index_textiles_on_code", unique: true, using: :btree
  add_index "textiles", ["group_id"], name: "index_textiles_on_group_id", using: :btree

  add_foreign_key "rolls", "textiles"
  add_foreign_key "textiles", "groups"
end
