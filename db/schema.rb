# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.0].define(version: 2022_03_23_225944) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "courses", force: :cascade do |t|
    t.string "id_ddc"
    t.string "site", default: "UC GAM"
    t.string "name"
    t.datetime "start_date"
    t.datetime "end_date"
    t.integer "total_hours"
    t.integer "quantity"
    t.string "days"
    t.integer "sessions_number"
    t.integer "profesor_id"
    t.boolean "confirmed"
    t.string "modality"
    t.integer "academy_id"
    t.string "status"
    t.integer "approved"
    t.integer "reprobated"
    t.string "downs"
    t.string "cost"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.time "start_hour"
    t.time "end_hour"
  end

  create_table "roles", force: :cascade do |t|
    t.string "name"
    t.string "resource_type"
    t.bigint "resource_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name", "resource_type", "resource_id"], name: "index_roles_on_name_and_resource_type_and_resource_id"
    t.index ["resource_type", "resource_id"], name: "index_roles_on_resource"
  end

  create_table "shelf_sections", force: :cascade do |t|
    t.bigint "shelf_id", null: false
    t.integer "number"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["shelf_id"], name: "index_shelf_sections_on_shelf_id"
  end

  create_table "shelves", force: :cascade do |t|
    t.bigint "warehouse_id", null: false
    t.string "code"
    t.string "category"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["warehouse_id"], name: "index_shelves_on_warehouse_id"
  end

  create_table "students", force: :cascade do |t|
    t.string "id_ddc"
    t.string "name"
    t.string "last_name"
    t.string "second_last_name"
    t.integer "taken_courses"
    t.string "gender"
    t.string "curp"
    t.string "scholarity"
    t.string "email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "course_id"
  end

  create_table "warehouses", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "workers", force: :cascade do |t|
    t.string "name"
    t.string "last_name"
    t.string "mail"
    t.string "telephone"
    t.string "password_digest"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "workers_roles", id: false, force: :cascade do |t|
    t.bigint "worker_id"
    t.bigint "role_id"
    t.index ["role_id"], name: "index_workers_roles_on_role_id"
    t.index ["worker_id", "role_id"], name: "index_workers_roles_on_worker_id_and_role_id"
    t.index ["worker_id"], name: "index_workers_roles_on_worker_id"
  end

  add_foreign_key "shelf_sections", "shelves"
  add_foreign_key "shelves", "warehouses"
end
