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

ActiveRecord::Schema.define(version: 20161024161106) do

  create_table "equipment", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "reference"
  end

  create_table "group_ids", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "groups", force: :cascade do |t|
    t.integer  "group_id_id"
    t.boolean  "current",     default: true
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
  end

  add_index "groups", ["group_id_id"], name: "index_groups_on_group_id_id"

  create_table "has_workers", force: :cascade do |t|
    t.integer  "worker_id"
    t.integer  "group_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "has_workers", ["group_id"], name: "index_has_workers_on_group_id"
  add_index "has_workers", ["worker_id"], name: "index_has_workers_on_worker_id"

  create_table "observations", force: :cascade do |t|
    t.integer  "equipment_id"
    t.time     "down"
    t.time     "ready"
    t.text     "comment"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.integer  "report_id"
  end

  add_index "observations", ["equipment_id"], name: "index_observations_on_equipment_id"
  add_index "observations", ["report_id"], name: "index_observations_on_report_id"

  create_table "reports", force: :cascade do |t|
    t.string   "shift"
    t.date     "date"
    t.integer  "group_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "reports", ["group_id"], name: "index_reports_on_group_id"

  create_table "shots", force: :cascade do |t|
    t.text     "comment"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "report_id"
  end

  add_index "shots", ["report_id"], name: "index_shots_on_report_id"

  create_table "tasks", force: :cascade do |t|
    t.integer  "equipment_id"
    t.text     "comment"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.integer  "report_id"
  end

  add_index "tasks", ["equipment_id"], name: "index_tasks_on_equipment_id"
  add_index "tasks", ["report_id"], name: "index_tasks_on_report_id"

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
    t.integer  "permission_level",       default: 1,  null: false
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.integer  "worker_id"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

  create_table "vehicle_statuses", force: :cascade do |t|
    t.integer  "vehicle_id"
    t.string   "status"
    t.string   "location"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "report_id"
  end

  add_index "vehicle_statuses", ["report_id"], name: "index_vehicle_statuses_on_report_id"
  add_index "vehicle_statuses", ["vehicle_id"], name: "index_vehicle_statuses_on_vehicle_id"

  create_table "vehicles", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "reference"
  end

  create_table "workers", force: :cascade do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.integer  "cc"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "code"
  end

end
