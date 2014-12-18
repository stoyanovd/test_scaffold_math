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

ActiveRecord::Schema.define(version: 20141217224205) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "answers", force: true do |t|
    t.text "body"
    t.integer "problem_id"
    t.integer "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string "figure_file_name"
    t.string "figure_content_type"
    t.integer "figure_file_size"
    t.datetime "figure_updated_at"
  end

  create_table "problem_lists", force: true do |t|
    t.string   "title"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "visibility"
  end

  create_table "problems", force: true do |t|
    t.integer  "number"
    t.text     "body"
    t.integer  "problem_list_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string "figure_file_name"
    t.string "figure_content_type"
    t.integer "figure_file_size"
    t.datetime "figure_updated_at"
  end

  create_table "result_colors", force: true do |t|
    t.string   "word"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "red"
    t.integer  "green"
    t.integer  "blue"
  end

  create_table "results", force: true do |t|
    t.string   "status"
    t.integer "user_id"
    t.integer  "problem_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string "password_digest"
  end

end
