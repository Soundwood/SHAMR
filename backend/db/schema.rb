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

ActiveRecord::Schema.define(version: 2020_10_09_225256) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "offense_categories", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "profile_offenses", force: :cascade do |t|
    t.bigint "twitter_profile_id", null: false
    t.bigint "offense_category_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["offense_category_id"], name: "index_profile_offenses_on_offense_category_id"
    t.index ["twitter_profile_id"], name: "index_profile_offenses_on_twitter_profile_id"
  end

  create_table "twitter_profiles", force: :cascade do |t|
    t.string "username"
    t.integer "user_id"
    t.string "display_name"
    t.boolean "offender"
    t.boolean "irreproachable"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  add_foreign_key "profile_offenses", "offense_categories"
  add_foreign_key "profile_offenses", "twitter_profiles"
end
