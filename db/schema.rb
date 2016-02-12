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

ActiveRecord::Schema.define(version: 20160209105624) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "case_types", force: :cascade do |t|
    t.string   "case_type"
    t.integer  "amount"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "cases", force: :cascade do |t|
    t.integer  "client_id"
    t.integer  "advocate_id"
    t.string   "case_title"
    t.string   "location"
    t.string   "case_detail"
    t.string   "case_document"
    t.string   "status"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.integer  "case_type_id"
  end

  add_index "cases", ["case_type_id"], name: "index_cases_on_case_type_id", using: :btree

  create_table "documents", force: :cascade do |t|
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.integer  "case_id"
    t.string   "doc_file_name"
    t.string   "doc_content_type"
    t.integer  "doc_file_size"
    t.datetime "doc_updated_at"
  end

  add_index "documents", ["case_id"], name: "index_documents_on_case_id", using: :btree

  add_foreign_key "cases", "case_types"
  add_foreign_key "documents", "cases"
end
