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

ActiveRecord::Schema[7.0].define(version: 2023_01_19_183533) do
  create_table "answers", force: :cascade do |t|
    t.string "content"
    t.integer "introvert_score"
    t.integer "question_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["question_id"], name: "index_answers_on_question_id"
  end

  create_table "personality_test_responses", force: :cascade do |t|
    t.integer "score"
    t.integer "personality_type_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["personality_type_id"], name: "index_personality_test_responses_on_personality_type_id"
  end

  create_table "personality_types", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name"], name: "index_personality_types_on_name", unique: true
  end

  create_table "questions", force: :cascade do |t|
    t.string "content"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "responses_answers", force: :cascade do |t|
    t.integer "personality_test_response_id", null: false
    t.integer "answer_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["answer_id"], name: "index_responses_answers_on_answer_id"
    t.index ["personality_test_response_id"], name: "index_responses_answers_on_personality_test_response_id"
  end

  add_foreign_key "answers", "questions"
  add_foreign_key "personality_test_responses", "personality_types"
  add_foreign_key "responses_answers", "answers"
  add_foreign_key "responses_answers", "personality_test_responses"
end
