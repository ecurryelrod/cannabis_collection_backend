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

ActiveRecord::Schema[7.0].define(version: 2022_05_19_223243) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "effects", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "strain_effects", force: :cascade do |t|
    t.bigint "strain_id", null: false
    t.bigint "effect_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["effect_id"], name: "index_strain_effects_on_effect_id"
    t.index ["strain_id"], name: "index_strain_effects_on_strain_id"
  end

  create_table "strains", force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.string "terpene"
    t.integer "thc_amount"
    t.integer "cbd_amount"
    t.integer "cbg_amount"
    t.bigint "type_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "user_id"
    t.index ["type_id"], name: "index_strains_on_type_id"
    t.index ["user_id"], name: "index_strains_on_user_id"
  end

  create_table "types", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email"
    t.string "password_digest"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "name"
  end

  add_foreign_key "strain_effects", "effects"
  add_foreign_key "strain_effects", "strains"
  add_foreign_key "strains", "types"
  add_foreign_key "strains", "users"
end
