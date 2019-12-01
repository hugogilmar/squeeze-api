# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2019_12_01_204848) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "squeeze_accounts", force: :cascade do |t|
    t.bigint "user_id"
    t.string "uuid", null: false
    t.integer "kind", default: 0
    t.string "description"
    t.string "reference_number", null: false
    t.datetime "deleted_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["deleted_at"], name: "index_squeeze_accounts_on_deleted_at"
    t.index ["kind"], name: "index_squeeze_accounts_on_kind"
    t.index ["user_id"], name: "index_squeeze_accounts_on_user_id"
    t.index ["uuid"], name: "index_squeeze_accounts_on_uuid", unique: true
  end

  create_table "squeeze_budgets", force: :cascade do |t|
    t.bigint "user_id"
    t.string "uuid", null: false
    t.string "description"
    t.datetime "deleted_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["deleted_at"], name: "index_squeeze_budgets_on_deleted_at"
    t.index ["user_id"], name: "index_squeeze_budgets_on_user_id"
    t.index ["uuid"], name: "index_squeeze_budgets_on_uuid", unique: true
  end

  create_table "squeeze_profiles", force: :cascade do |t|
    t.bigint "user_id"
    t.string "uuid", null: false
    t.string "first_name", null: false
    t.string "last_name", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_squeeze_profiles_on_user_id"
    t.index ["uuid"], name: "index_squeeze_profiles_on_uuid", unique: true
  end

  create_table "squeeze_users", force: :cascade do |t|
    t.string "uuid", null: false
    t.string "email", null: false
    t.string "password_digest"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["email"], name: "index_squeeze_users_on_email", unique: true
    t.index ["uuid"], name: "index_squeeze_users_on_uuid", unique: true
  end

  add_foreign_key "squeeze_accounts", "squeeze_users", column: "user_id"
  add_foreign_key "squeeze_budgets", "squeeze_users", column: "user_id"
  add_foreign_key "squeeze_profiles", "squeeze_users", column: "user_id"
end
