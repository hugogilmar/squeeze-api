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

ActiveRecord::Schema.define(version: 2020_05_16_185110) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "pgcrypto"
  enable_extension "plpgsql"

  create_table "squeeze_accounts", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.uuid "user_id"
    t.integer "kind", default: 0
    t.string "description"
    t.string "reference_number", null: false
    t.datetime "deleted_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["deleted_at"], name: "index_squeeze_accounts_on_deleted_at"
    t.index ["kind"], name: "index_squeeze_accounts_on_kind"
    t.index ["user_id"], name: "index_squeeze_accounts_on_user_id"
  end

  create_table "squeeze_budgets", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.uuid "user_id"
    t.string "description"
    t.datetime "deleted_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["deleted_at"], name: "index_squeeze_budgets_on_deleted_at"
    t.index ["user_id"], name: "index_squeeze_budgets_on_user_id"
  end

  create_table "squeeze_categories", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.uuid "budget_id"
    t.string "description"
    t.decimal "amount", precision: 10, scale: 2, default: "0.0", null: false
    t.datetime "deleted_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["budget_id"], name: "index_squeeze_categories_on_budget_id"
    t.index ["deleted_at"], name: "index_squeeze_categories_on_deleted_at"
  end

  create_table "squeeze_expenses", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.uuid "budget_id"
    t.uuid "category_id"
    t.uuid "account_id"
    t.string "description"
    t.decimal "amount", precision: 10, scale: 2, default: "0.0", null: false
    t.datetime "deleted_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.datetime "scheduled_for"
    t.text "meta"
    t.index ["account_id"], name: "index_squeeze_expenses_on_account_id"
    t.index ["budget_id"], name: "index_squeeze_expenses_on_budget_id"
    t.index ["category_id"], name: "index_squeeze_expenses_on_category_id"
    t.index ["deleted_at"], name: "index_squeeze_expenses_on_deleted_at"
  end

  create_table "squeeze_incomes", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.uuid "budget_id"
    t.uuid "category_id"
    t.uuid "account_id"
    t.string "description"
    t.decimal "amount", precision: 10, scale: 2, default: "0.0", null: false
    t.datetime "deleted_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["account_id"], name: "index_squeeze_incomes_on_account_id"
    t.index ["budget_id"], name: "index_squeeze_incomes_on_budget_id"
    t.index ["category_id"], name: "index_squeeze_incomes_on_category_id"
    t.index ["deleted_at"], name: "index_squeeze_incomes_on_deleted_at"
  end

  create_table "squeeze_operations", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.uuid "account_id"
    t.string "operable_type"
    t.uuid "operable_id"
    t.decimal "amount", precision: 10, scale: 2, default: "0.0", null: false
    t.datetime "deleted_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["account_id"], name: "index_squeeze_operations_on_account_id"
    t.index ["deleted_at"], name: "index_squeeze_operations_on_deleted_at"
    t.index ["operable_type", "operable_id"], name: "index_squeeze_operation_on_operable_columns"
  end

  create_table "squeeze_profiles", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.uuid "user_id"
    t.string "first_name", null: false
    t.string "last_name", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.datetime "deleted_at"
    t.index ["deleted_at"], name: "index_squeeze_profiles_on_deleted_at"
    t.index ["user_id"], name: "index_squeeze_profiles_on_user_id"
  end

  create_table "squeeze_users", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "email", null: false
    t.string "password_digest"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.datetime "deleted_at"
    t.index ["deleted_at"], name: "index_squeeze_users_on_deleted_at"
    t.index ["email"], name: "index_squeeze_users_on_email", unique: true
  end

  add_foreign_key "squeeze_accounts", "squeeze_users", column: "user_id"
  add_foreign_key "squeeze_budgets", "squeeze_users", column: "user_id"
  add_foreign_key "squeeze_categories", "squeeze_budgets", column: "budget_id"
  add_foreign_key "squeeze_expenses", "squeeze_accounts", column: "account_id"
  add_foreign_key "squeeze_expenses", "squeeze_budgets", column: "budget_id"
  add_foreign_key "squeeze_expenses", "squeeze_categories", column: "category_id"
  add_foreign_key "squeeze_incomes", "squeeze_accounts", column: "account_id"
  add_foreign_key "squeeze_incomes", "squeeze_budgets", column: "budget_id"
  add_foreign_key "squeeze_incomes", "squeeze_categories", column: "category_id"
  add_foreign_key "squeeze_operations", "squeeze_accounts", column: "account_id"
  add_foreign_key "squeeze_profiles", "squeeze_users", column: "user_id"
end
