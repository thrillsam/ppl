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

ActiveRecord::Schema.define(version: 2019_11_28_140712) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.bigint "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.bigint "byte_size", null: false
    t.string "checksum", null: false
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "cities", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "match_details", force: :cascade do |t|
    t.bigint "season_id"
    t.bigint "city_id"
    t.date "match_date"
    t.bigint "team_1_id"
    t.bigint "team_2_id"
    t.bigint "toss_winner_id"
    t.integer "toss_decision"
    t.integer "result"
    t.boolean "dl_applied", default: false
    t.bigint "match_winner_id"
    t.integer "win_by_runs"
    t.integer "win_by_wickets", limit: 2
    t.string "player_of_match"
    t.bigint "venue_id"
    t.bigint "umpire_1_id"
    t.bigint "umpire_2_id"
    t.bigint "umpire_3_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["city_id"], name: "index_match_details_on_city_id"
    t.index ["match_winner_id"], name: "index_match_details_on_match_winner_id"
    t.index ["season_id"], name: "index_match_details_on_season_id"
    t.index ["team_1_id"], name: "index_match_details_on_team_1_id"
    t.index ["team_2_id"], name: "index_match_details_on_team_2_id"
    t.index ["toss_winner_id"], name: "index_match_details_on_toss_winner_id"
    t.index ["umpire_1_id"], name: "index_match_details_on_umpire_1_id"
    t.index ["umpire_2_id"], name: "index_match_details_on_umpire_2_id"
    t.index ["umpire_3_id"], name: "index_match_details_on_umpire_3_id"
    t.index ["venue_id"], name: "index_match_details_on_venue_id"
  end

  create_table "seasons", force: :cascade do |t|
    t.integer "year"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "teams", force: :cascade do |t|
    t.string "name"
    t.integer "city_id"
    t.string "color"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "umpires", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.string "password_digest"
    t.integer "team_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "venues", force: :cascade do |t|
    t.string "name"
    t.integer "city_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "match_details", "cities"
  add_foreign_key "match_details", "seasons"
  add_foreign_key "match_details", "teams", column: "match_winner_id"
  add_foreign_key "match_details", "teams", column: "team_1_id"
  add_foreign_key "match_details", "teams", column: "team_2_id"
  add_foreign_key "match_details", "teams", column: "toss_winner_id"
  add_foreign_key "match_details", "umpires", column: "umpire_1_id"
  add_foreign_key "match_details", "umpires", column: "umpire_2_id"
  add_foreign_key "match_details", "umpires", column: "umpire_3_id"
  add_foreign_key "match_details", "venues"
end
