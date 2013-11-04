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

ActiveRecord::Schema.define(version: 20131104113527) do

  create_table "answers", force: true do |t|
    t.integer  "option_id"
    t.text     "value"
    t.integer  "response_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "answers", ["option_id"], name: "index_answers_on_option_id"
  add_index "answers", ["response_id"], name: "index_answers_on_response_id"

  create_table "options", force: true do |t|
    t.integer  "question_id"
    t.string   "value"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "options", ["question_id"], name: "index_options_on_question_id"

  create_table "questions", force: true do |t|
    t.text     "title"
    t.integer  "survey_id"
    t.string   "kind"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "questions", ["survey_id"], name: "index_questions_on_survey_id"

  create_table "responses", force: true do |t|
    t.integer  "survey_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "surveys", force: true do |t|
    t.string   "title"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
