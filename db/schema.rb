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

ActiveRecord::Schema.define(version: 20161226084953) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "cards", force: :cascade do |t|
    t.text     "text"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "type"
    t.string   "text_type"
    t.integer  "blanks"
    t.integer  "stack_id",   null: false
  end

  create_table "games", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "games_stacks", id: false, force: :cascade do |t|
    t.integer "game_id",  null: false
    t.integer "stack_id", null: false
    t.index ["game_id", "stack_id"], name: "index_games_stacks_on_game_id_and_stack_id", unique: true, using: :btree
  end

  create_table "hands", primary_key: ["round_id", "player_id"], force: :cascade do |t|
    t.integer  "round_id",    null: false
    t.integer  "player_id",   null: false
    t.integer  "card_id",     null: false
    t.boolean  "player_pick", null: false
    t.boolean  "tzar_pick",   null: false
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["round_id", "player_id"], name: "index_hands_on_round_id_and_player_id", unique: true, using: :btree
  end

  create_table "players", force: :cascade do |t|
    t.string   "name"
    t.string   "email",                  default: "", null: false
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.index ["email"], name: "index_players_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_players_on_reset_password_token", unique: true, using: :btree
  end

  create_table "rounds", force: :cascade do |t|
    t.integer  "game_id",       null: false
    t.integer  "card_czar_id",  null: false
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.integer  "black_card_id", null: false
  end

  create_table "scores", primary_key: ["game_id", "player_id"], force: :cascade do |t|
    t.integer  "game_id",                null: false
    t.integer  "player_id",              null: false
    t.integer  "points",     default: 0, null: false
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
    t.index ["game_id", "player_id"], name: "index_scores_on_game_id_and_player_id", unique: true, using: :btree
  end

  create_table "stacks", force: :cascade do |t|
    t.string   "name",       null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "cards", "stacks"
  add_foreign_key "games_stacks", "games"
  add_foreign_key "games_stacks", "stacks"
  add_foreign_key "hands", "cards"
  add_foreign_key "hands", "players"
  add_foreign_key "hands", "rounds"
  add_foreign_key "rounds", "cards", column: "black_card_id"
  add_foreign_key "rounds", "games"
  add_foreign_key "rounds", "players", column: "card_czar_id"
  add_foreign_key "scores", "games"
  add_foreign_key "scores", "players"
end
