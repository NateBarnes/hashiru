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

ActiveRecord::Schema.define(version: 20130922061649) do

  create_table "events", force: true do |t|
    t.string   "name"
    t.datetime "date"
    t.string   "distance"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
    t.string   "asset_guid"
  end

  create_table "exercises", force: true do |t|
    t.integer  "time"
    t.float    "efficacy"
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "units"
    t.string   "instructions"
  end

  create_table "general_efficacies", force: true do |t|
    t.integer  "exercise_id"
    t.float    "speed_score"
    t.float    "distance_score"
    t.float    "general_score"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "measurements", force: true do |t|
    t.string   "unit"
    t.integer  "value"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "workout_exercise_id"
  end

  create_table "users", force: true do |t|
    t.string   "name"
    t.integer  "mile_time"
    t.float    "longest_distance"
    t.string   "gender"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "goal_type"
    t.integer  "cluster",          default: 0
  end

  create_table "workout_exercises", force: true do |t|
    t.integer  "workout_id"
    t.integer  "exercise_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "workouts", force: true do |t|
    t.datetime "day"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
  end

end
