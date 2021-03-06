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

ActiveRecord::Schema.define(version: 20160920012314) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "hosts", force: :cascade do |t|
    t.string   "host_id"
    t.string   "host_name"
    t.string   "email"
    t.string   "password"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.string   "access_token"
    t.string   "user_id"
  end

  create_table "listings", force: :cascade do |t|
    t.string   "host_id"
    t.string   "listing_id"
    t.datetime "created_at",                                           null: false
    t.datetime "updated_at",                                           null: false
    t.string   "listing_address"
    t.string   "name"
    t.boolean  "auto_active_deactive", default: false,                 null: false
    t.time     "active_time_start",    default: '2000-01-01 20:00:00', null: false
    t.time     "active_time_end",      default: '2000-01-01 08:00:00', null: false
    t.integer  "area"
    t.text     "key"
    t.text     "cleaning_goods"
    t.text     "garbage"
  end

  create_table "reservations", force: :cascade do |t|
    t.string   "guest_name"
    t.string   "host_name"
    t.date     "start_date"
    t.date     "end_date"
    t.integer  "number_of_guests"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.string   "listing_id"
    t.string   "reservation_id"
    t.string   "host_id"
    t.string   "user_id"
  end

  create_table "roles", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "roles_users", id: false, force: :cascade do |t|
    t.integer "user_id", null: false
    t.integer "role_id", null: false
  end

  create_table "schedules", force: :cascade do |t|
    t.string   "host_id"
    t.string   "listing_id"
    t.string   "user_id"
    t.date     "cleaning_date"
    t.string   "staff_id"
    t.string   "wait_time"
    t.date     "next_checkin"
    t.datetime "created_at",                       null: false
    t.datetime "updated_at",                       null: false
    t.string   "reservation_id"
    t.string   "start_time",     default: "11:00"
    t.string   "end_time",       default: "15:00"
  end

  create_table "temp_staffs", force: :cascade do |t|
    t.string   "name"
    t.string   "email"
    t.string   "tel"
    t.date     "interview_request_date"
    t.datetime "interview_date"
    t.string   "line_id"
    t.text     "inquiry"
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
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
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "name",                   default: "", null: false
    t.boolean  "admin"
    t.boolean  "staff"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

end
