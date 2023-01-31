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

ActiveRecord::Schema[7.0].define(version: 2023_01_27_141547) do
  create_table "answers", force: :cascade do |t|
    t.integer "question_id"
    t.text "content"
    t.boolean "correct", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["question_id"], name: "index_answers_on_question_id"
  end

  create_table "choices", force: :cascade do |t|
    t.integer "multiple_choice_challenge_id"
    t.integer "answer_id"
    t.text "content"
    t.boolean "correct"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["answer_id"], name: "index_choices_on_answer_id"
    t.index ["multiple_choice_challenge_id"], name: "index_choices_on_multiple_choice_challenge_id"
  end

  create_table "match_challenges", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "match_pair_questions", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "multiple_choice_challenges", force: :cascade do |t|
    t.integer "question_id"
    t.integer "choice_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["choice_id"], name: "index_multiple_choice_challenges_on_choice_id"
    t.index ["question_id"], name: "index_multiple_choice_challenges_on_question_id"
  end

  create_table "multiple_choice_questions", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "partners", force: :cascade do |t|
    t.text "content"
    t.integer "position", default: 0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "questions", force: :cascade do |t|
    t.string "title"
    t.string "questionable_type"
    t.integer "questionable_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "sources", force: :cascade do |t|
    t.integer "match_challenge_id"
    t.integer "partner_id"
    t.text "content"
    t.integer "position", default: 0
    t.boolean "correct"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["match_challenge_id"], name: "index_sources_on_match_challenge_id"
    t.index ["partner_id"], name: "index_sources_on_partner_id"
  end

  add_foreign_key "answers", "questions"
  add_foreign_key "choices", "answers"
  add_foreign_key "choices", "multiple_choice_challenges"
  add_foreign_key "multiple_choice_challenges", "choices"
  add_foreign_key "multiple_choice_challenges", "questions"
  add_foreign_key "sources", "match_challenges"
  add_foreign_key "sources", "partners"
end
