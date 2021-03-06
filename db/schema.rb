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

ActiveRecord::Schema.define(:version => 20120515043222) do

  create_table "days", :force => true do |t|
    t.date     "date"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "details", :force => true do |t|
    t.string   "target_type"
    t.integer  "target_id"
    t.text     "note"
    t.string   "payload"
    t.integer  "member_id"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
    t.integer  "position"
  end

  create_table "endeavors", :force => true do |t|
    t.integer  "goal_id"
    t.integer  "member_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.integer  "position"
  end

  add_index "endeavors", ["goal_id"], :name => "index_endeavors_on_goal_id"
  add_index "endeavors", ["member_id"], :name => "index_endeavors_on_member_id"

  create_table "facilitations", :force => true do |t|
    t.integer  "sub_club_id"
    t.integer  "member_id"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  add_index "facilitations", ["member_id"], :name => "index_facilitations_on_member_id"
  add_index "facilitations", ["sub_club_id"], :name => "index_facilitations_on_sub_club_id"

  create_table "goals", :force => true do |t|
    t.string   "title"
    t.text     "description"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "invitees", :force => true do |t|
    t.string   "email"
    t.integer  "facebook_id"
    t.integer  "invite_id"
    t.integer  "member_id"
    t.string   "confirmation_token"
    t.datetime "created_at",         :null => false
    t.datetime "updated_at",         :null => false
  end

  create_table "invites", :force => true do |t|
    t.text     "message"
    t.integer  "member_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "members", :force => true do |t|
    t.string   "first_name"
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
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email"
    t.string   "authentication_token"
    t.datetime "created_at",                             :null => false
    t.datetime "updated_at",                             :null => false
  end

  add_index "members", ["authentication_token"], :name => "index_members_on_authentication_token", :unique => true
  add_index "members", ["confirmation_token"], :name => "index_members_on_confirmation_token", :unique => true
  add_index "members", ["email"], :name => "index_members_on_email", :unique => true
  add_index "members", ["reset_password_token"], :name => "index_members_on_reset_password_token", :unique => true

  create_table "memberships", :force => true do |t|
    t.integer  "sub_club_id"
    t.integer  "member_id"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
    t.integer  "position"
    t.boolean  "approved"
  end

  add_index "memberships", ["member_id"], :name => "index_memberships_on_member_id"
  add_index "memberships", ["sub_club_id"], :name => "index_memberships_on_sub_club_id"

  create_table "scores", :force => true do |t|
    t.integer  "endeavor_id"
    t.integer  "day_id"
    t.integer  "mark"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
    t.date     "date"
  end

  add_index "scores", ["day_id"], :name => "index_scores_on_day_id"
  add_index "scores", ["endeavor_id"], :name => "index_scores_on_endeavor_id"

  create_table "sub_clubs", :force => true do |t|
    t.string   "name"
    t.text     "description"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "tier_houses", :force => true do |t|
    t.integer  "sub_club_id"
    t.integer  "tier_id"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
    t.integer  "position"
    t.boolean  "approved"
  end

  add_index "tier_houses", ["sub_club_id"], :name => "index_tier_houses_on_sub_club_id"
  add_index "tier_houses", ["tier_id"], :name => "index_tier_houses_on_tier_id"

  create_table "tierings", :force => true do |t|
    t.integer  "endeavor_id"
    t.integer  "tier_id"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
    t.integer  "position"
  end

  add_index "tierings", ["endeavor_id"], :name => "index_tierings_on_endeavor_id"
  add_index "tierings", ["tier_id"], :name => "index_tierings_on_tier_id"

  create_table "tiers", :force => true do |t|
    t.string   "name"
    t.text     "note"
    t.integer  "member_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.integer  "position"
  end

end
