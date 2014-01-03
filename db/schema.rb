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

ActiveRecord::Schema.define(version: 20140103195740) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "organizations", force: true do |t|
    t.string   "address"
    t.text     "recipient_emails", default: [], array: true
    t.text     "member_emails",    default: [], array: true
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "name"
  end

  add_index "organizations", ["member_emails"], name: "index_organizations_on_member_emails", using: :gin
  add_index "organizations", ["recipient_emails"], name: "index_organizations_on_recipient_emails", using: :gin

  create_table "submissions", force: true do |t|
    t.text     "body"
    t.string   "email"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "organization_id"
  end

  add_index "submissions", ["organization_id"], name: "index_submissions_on_organization_id", using: :btree

end
