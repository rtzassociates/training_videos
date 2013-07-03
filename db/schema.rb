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

ActiveRecord::Schema.define(:version => 20130703192850) do

  create_table "comments", :force => true do |t|
    t.integer  "viewer_id"
    t.text     "content"
    t.datetime "created_at",          :null => false
    t.datetime "updated_at",          :null => false
    t.integer  "training_session_id"
    t.integer  "viewing_id"
    t.integer  "site_id"
  end

  create_table "delayed_jobs", :force => true do |t|
    t.integer  "priority",   :default => 0
    t.integer  "attempts",   :default => 0
    t.text     "handler"
    t.text     "last_error"
    t.datetime "run_at"
    t.datetime "locked_at"
    t.datetime "failed_at"
    t.string   "locked_by"
    t.string   "queue"
    t.datetime "created_at",                :null => false
    t.datetime "updated_at",                :null => false
  end

  add_index "delayed_jobs", ["priority", "run_at"], :name => "delayed_jobs_priority"

  create_table "site_contents", :force => true do |t|
    t.text     "training_session_greeting"
    t.text     "footer_text"
    t.integer  "site_id"
    t.datetime "created_at",                :null => false
    t.datetime "updated_at",                :null => false
  end

  create_table "site_training_sessions", :force => true do |t|
    t.integer  "site_id"
    t.integer  "training_session_id"
    t.datetime "created_at",          :null => false
    t.datetime "updated_at",          :null => false
    t.integer  "position"
  end

  create_table "sites", :force => true do |t|
    t.string   "name"
    t.string   "subdomain"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
    t.string   "banner_image"
  end

  create_table "style_settings", :force => true do |t|
    t.string   "body_background_color"
    t.string   "footer_background_color"
    t.string   "footer_text_color"
    t.integer  "site_id"
    t.datetime "created_at",              :null => false
    t.datetime "updated_at",              :null => false
    t.string   "link_color"
  end

  create_table "training_sessions", :force => true do |t|
    t.string   "name"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
    t.integer  "user_id"
    t.integer  "category_id"
    t.text     "description"
    t.string   "thumbnail"
    t.boolean  "success"
    t.string   "pdf"
    t.text     "vimeo_embed"
  end

  create_table "users", :force => true do |t|
    t.string   "username"
    t.string   "password_hash"
    t.string   "token"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
    t.boolean  "admin"
    t.integer  "site_id"
  end

  create_table "viewers", :force => true do |t|
    t.integer  "user_id"
    t.string   "email"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.string   "name"
  end

  create_table "viewings", :force => true do |t|
    t.integer  "viewer_id"
    t.string   "participants"
    t.datetime "created_at",          :null => false
    t.datetime "updated_at",          :null => false
    t.integer  "training_session_id"
    t.datetime "completed_at"
    t.integer  "site_id"
  end

end
