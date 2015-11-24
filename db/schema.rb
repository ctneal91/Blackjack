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

ActiveRecord::Schema.define(version: 20151124041949) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "cards", force: :cascade do |t|
    t.integer  "position"
    t.string   "suit"
    t.integer  "value"
    t.string   "name"
    t.integer  "game_id"
    t.integer  "hand_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "games", force: :cascade do |t|
    t.datetime "created_at",                    null: false
    t.datetime "updated_at",                    null: false
    t.boolean  "player_wins",   default: false
    t.boolean  "dealer_wins",   default: false
    t.boolean  "push",          default: false
    t.boolean  "player_stayed", default: false
  end

  create_table "hands", force: :cascade do |t|
    t.integer  "game_id"
    t.boolean  "player"
    t.datetime "created_at",                         null: false
    t.datetime "updated_at",                         null: false
    t.boolean  "blackjack",          default: false
    t.boolean  "dealer_must_reveal", default: false
  end

end
