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

ActiveRecord::Schema[7.0].define(version: 2023_02_02_133231) do
  create_table "choices", force: :cascade do |t|
    t.integer "multiple_choice_challenge_id"
    t.text "content"
    t.boolean "correct"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["multiple_choice_challenge_id"], name: "index_choices_on_multiple_choice_challenge_id"
  end

  create_table "match_challenges", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "multiple_choice_challenges", force: :cascade do |t|
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
    t.boolean "correct", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["match_challenge_id"], name: "index_sources_on_match_challenge_id"
    t.index ["partner_id"], name: "index_sources_on_partner_id"
  end

  add_foreign_key "choices", "multiple_choice_challenges"
  add_foreign_key "sources", "match_challenges"
  add_foreign_key "sources", "partners"
end
