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

ActiveRecord::Schema.define(version: 20161023151822) do

  create_table "equipment", force: :cascade do |t|
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
    t.string   "reference",  limit: 255
  end

  create_table "group_ids", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "groups", force: :cascade do |t|
    t.integer  "group_id_id", limit: 4
    t.boolean  "current",               default: false
    t.datetime "created_at",                            null: false
    t.datetime "updated_at",                            null: false
  end

  add_index "groups", ["group_id_id"], name: "index_groups_on_group_id_id", using: :btree

  create_table "has_workers", force: :cascade do |t|
    t.integer  "worker_id",  limit: 4
    t.integer  "group_id",   limit: 4
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
  end

  add_index "has_workers", ["group_id"], name: "index_has_workers_on_group_id", using: :btree
  add_index "has_workers", ["worker_id"], name: "index_has_workers_on_worker_id", using: :btree

  create_table "observations", force: :cascade do |t|
    t.integer  "equipment_id", limit: 4
    t.time     "down"
    t.time     "ready"
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  add_index "observations", ["equipment_id"], name: "index_observations_on_equipment_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "email",                  limit: 255, default: "", null: false
    t.string   "encrypted_password",     limit: 255, default: "", null: false
    t.string   "reset_password_token",   limit: 255
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          limit: 4,   default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip",     limit: 255
    t.string   "last_sign_in_ip",        limit: 255
    t.integer  "permission_level",       limit: 4,   default: 1,  null: false
    t.datetime "created_at",                                      null: false
    t.datetime "updated_at",                                      null: false
    t.integer  "worker_id",              limit: 4
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  add_index "users", ["worker_id"], name: "fk_rails_79dca46b80", using: :btree

  create_table "vehicles", force: :cascade do |t|
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
    t.string   "reference",  limit: 255
  end

  create_table "workers", force: :cascade do |t|
    t.string   "first_name", limit: 255
    t.string   "last_name",  limit: 255
    t.integer  "cc",         limit: 4
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
    t.string   "code",       limit: 255
  end

  add_foreign_key "groups", "group_ids"
  add_foreign_key "has_workers", "groups"
  add_foreign_key "has_workers", "workers"
  add_foreign_key "observations", "equipment"
  add_foreign_key "users", "workers"
end
