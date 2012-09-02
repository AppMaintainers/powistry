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

ActiveRecord::Schema.define(:version => 20120902104234) do

  create_table "bookmarks", :force => true do |t|
    t.integer  "user_id"
    t.string   "name"
    t.string   "location"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "bookmarks", ["user_id"], :name => "index_bookmarks_on_user_id"

  create_table "complexities", :force => true do |t|
    t.string    "code"
    t.integer   "planned_duration_min"
    t.integer   "planned_duration_max"
    t.integer   "points"
    t.timestamp "created_at",           :null => false
    t.timestamp "updated_at",           :null => false
  end

  create_table "estimations", :force => true do |t|
    t.integer   "user_id"
    t.integer   "task_id"
    t.integer   "complexity_id"
    t.timestamp "created_at",    :null => false
    t.timestamp "updated_at",    :null => false
  end

  add_index "estimations", ["complexity_id"], :name => "index_estimations_on_complexity_id"
  add_index "estimations", ["task_id"], :name => "index_estimations_on_task_id"
  add_index "estimations", ["user_id"], :name => "index_estimations_on_user_id"

  create_table "projects", :force => true do |t|
    t.string    "name"
    t.timestamp "created_at", :null => false
    t.timestamp "updated_at", :null => false
  end

  create_table "projects_users", :id => false, :force => true do |t|
    t.integer "user_id",    :null => false
    t.integer "project_id", :null => false
  end

  add_index "projects_users", ["user_id", "project_id"], :name => "index_projects_users_on_user_id_and_project_id", :unique => true

  create_table "rails_admin_histories", :force => true do |t|
    t.text      "message"
    t.string    "username"
    t.integer   "item"
    t.string    "table"
    t.integer   "month"
    t.integer   "year"
    t.timestamp "created_at", :null => false
    t.timestamp "updated_at", :null => false
  end

  add_index "rails_admin_histories", ["item", "table", "month", "year"], :name => "index_rails_admin_histories"

  create_table "tasks", :force => true do |t|
    t.integer   "user_id"
    t.integer   "project_id"
    t.string    "name"
    t.string    "description"
    t.date      "start_date"
    t.date      "end_date"
    t.string    "invoice_number"
    t.integer   "invested_hours"
    t.timestamp "created_at",           :null => false
    t.timestamp "updated_at",           :null => false
    t.float     "final_complexity"
    t.float     "corrected_complexity"
    t.string    "url"
  end

  add_index "tasks", ["project_id"], :name => "index_tasks_on_project_id"
  add_index "tasks", ["user_id"], :name => "index_tasks_on_user_id"

  create_table "users", :force => true do |t|
    t.string    "name"
    t.string    "monogram"
    t.boolean   "admin"
    t.timestamp "created_at",                             :null => false
    t.timestamp "updated_at",                             :null => false
    t.string    "encrypted_password",     :default => "", :null => false
    t.string    "reset_password_token"
    t.timestamp "reset_password_sent_at"
    t.timestamp "remember_created_at"
    t.integer   "sign_in_count",          :default => 0
    t.timestamp "current_sign_in_at"
    t.timestamp "last_sign_in_at"
    t.string    "current_sign_in_ip"
    t.string    "last_sign_in_ip"
    t.string    "email",                  :default => "", :null => false
    t.string    "avatar_url"
  end

  add_index "users", ["name"], :name => "index_users_on_name", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

end
