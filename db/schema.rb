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

ActiveRecord::Schema.define(version: 20181126153755) do

  create_table "active_admin_comments", force: :cascade do |t|
    t.string   "namespace"
    t.text     "body"
    t.string   "resource_type"
    t.integer  "resource_id"
    t.string   "author_type"
    t.integer  "author_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.index ["author_type", "author_id"], name: "index_active_admin_comments_on_author_type_and_author_id"
    t.index ["namespace"], name: "index_active_admin_comments_on_namespace"
    t.index ["resource_type", "resource_id"], name: "index_active_admin_comments_on_resource_type_and_resource_id"
  end

  create_table "gameloggings", force: :cascade do |t|
    t.text     "newschronic"
    t.datetime "eventime"
    t.integer  "scorepl1"
    t.integer  "scoreplayer2"
    t.boolean  "finalpoints"
    t.integer  "game_id"
    t.integer  "player1_id"
    t.integer  "player2_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.index ["game_id"], name: "index_gameloggings_on_game_id"
    t.index ["player1_id"], name: "index_gameloggings_on_player1_id"
    t.index ["player2_id"], name: "index_gameloggings_on_player2_id"
  end

  create_table "gamerounds", force: :cascade do |t|
    t.text     "round"
    t.integer  "game_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["game_id"], name: "index_gamerounds_on_game_id"
  end

  create_table "games", force: :cascade do |t|
    t.string   "game"
    t.datetime "date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "histories", force: :cascade do |t|
    t.integer  "player_id"
    t.string   "oponent"
    t.integer  "status"
    t.float    "award"
    t.string   "name"
    t.text     "chronic"
    t.text     "score"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["player_id"], name: "index_histories_on_player_id"
  end

  create_table "leaderboards", force: :cascade do |t|
    t.integer  "ranking"
    t.integer  "player_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["player_id"], name: "index_leaderboards_on_player_id"
  end

  create_table "players", force: :cascade do |t|
    t.string   "name"
    t.string   "email"
    t.string   "city"
    t.integer  "postal_code"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.string   "street"
  end

  create_table "scoreboards", force: :cascade do |t|
    t.integer  "scoreplayer1"
    t.integer  "scoreplayer2"
    t.integer  "player_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.index ["player_id"], name: "index_scoreboards_on_player_id"
  end

end
