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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20130402065208) do

  create_table "users", :force => true do |t|
    t.string   "email",                  :default => "", :null => false
    t.string   "encrypted_password",     :default => "", :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                             :null => false
    t.datetime "updated_at",                             :null => false
    t.string   "title"
    t.string   "fname"
    t.string   "lname"
    t.string   "sex"
    t.text     "address"
    t.string   "telephone"
    t.string   "mobile"
    t.date     "dob"
    t.string   "state"
    t.string   "lga"
    t.string   "constituency"
    t.string   "party"
    t.string   "spouse"
    t.string   "children"
    t.string   "highest_degree"
    t.string   "secondary_school"
    t.string   "first_degree"
    t.string   "second_degree"
    t.string   "doctorate"
    t.string   "postdoctorate"
    t.text     "employment_private"
    t.text     "employment_public"
    t.string   "public_first"
    t.date     "public_first_date"
    t.date     "first_house_election"
    t.text     "committees_served"
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

end
