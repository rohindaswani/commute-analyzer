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

ActiveRecord::Schema.define(version: 2020_01_06_000859) do

  create_table "commute_times", force: :cascade do |t|
    t.datetime "leave_at"
    t.integer "origin_id"
    t.integer "destination_id"
    t.string "distance"
    t.string "route_summary"
    t.string "optimistic_time"
    t.string "best_guess_time"
    t.string "pessimistic_time"
    t.text "warnings"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["destination_id"], name: "index_commute_times_on_destination_id"
    t.index ["origin_id"], name: "index_commute_times_on_origin_id"
  end

  create_table "locations", force: :cascade do |t|
    t.string "name"
    t.string "coordinates_decimal_degrees"
  end

end
