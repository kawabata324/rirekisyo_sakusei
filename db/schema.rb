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

ActiveRecord::Schema[7.0].define(version: 2023_03_11_140211) do
  create_table "addresses", force: :cascade do |t|
    t.integer "postal_code"
    t.string "content", default: ""
    t.string "content_kana", default: ""
    t.integer "personal_history_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["personal_history_id"], name: "index_addresses_on_personal_history_id"
  end

  create_table "educational_back_grounds", force: :cascade do |t|
    t.integer "personal_history_id", null: false
    t.string "description", default: ""
    t.date "happened_on"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["personal_history_id"], name: "index_educational_back_grounds_on_personal_history_id"
  end

  create_table "internship_back_grounds", force: :cascade do |t|
    t.integer "personal_history_id", null: false
    t.string "description", default: ""
    t.date "happened_on"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["personal_history_id"], name: "index_internship_back_grounds_on_personal_history_id"
  end

  create_table "license_back_grounds", force: :cascade do |t|
    t.integer "personal_history_id", null: false
    t.string "description", default: ""
    t.date "happened_on"
    t.date "資格・免許取得日"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["personal_history_id"], name: "index_license_back_grounds_on_personal_history_id"
  end

  create_table "personal_histories", force: :cascade do |t|
    t.string "uuid"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "name", default: "履歴書", null: false
  end

  create_table "profiles", force: :cascade do |t|
    t.string "first_name", default: ""
    t.string "first_name_kana", default: ""
    t.string "last_name", default: ""
    t.string "last_name_kana", default: ""
    t.string "email", default: ""
    t.integer "phone_number"
    t.date "birth_date_on"
    t.integer "age"
    t.string "sex", default: ""
    t.integer "personal_history_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["personal_history_id"], name: "index_profiles_on_personal_history_id"
  end

  create_table "programing_back_grounds", force: :cascade do |t|
    t.integer "personal_history_id", null: false
    t.string "description", default: ""
    t.date "happened_on"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["personal_history_id"], name: "index_programing_back_grounds_on_personal_history_id"
  end

  create_table "self_contents", force: :cascade do |t|
    t.integer "personal_history_id", null: false
    t.text "description", default: ""
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["personal_history_id"], name: "index_self_contents_on_personal_history_id"
  end

  add_foreign_key "addresses", "personal_histories"
  add_foreign_key "educational_back_grounds", "personal_histories"
  add_foreign_key "internship_back_grounds", "personal_histories"
  add_foreign_key "license_back_grounds", "personal_histories"
  add_foreign_key "profiles", "personal_histories"
  add_foreign_key "programing_back_grounds", "personal_histories"
  add_foreign_key "self_contents", "personal_histories"
end
