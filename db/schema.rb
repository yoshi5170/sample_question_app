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

ActiveRecord::Schema[7.0].define(version: 2023_10_15_174619) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "choices", force: :cascade do |t|
    t.bigint "diagnosis_question_id", null: false
    t.string "choice_text", null: false
    t.integer "score", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["diagnosis_question_id"], name: "index_choices_on_diagnosis_question_id"
  end

  create_table "diagnosis_questions", force: :cascade do |t|
    t.string "question_text", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "diagnosis_results", force: :cascade do |t|
    t.integer "score_range_start", null: false
    t.integer "score_range_end", null: false
    t.text "result_text", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "user_choices", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "choice_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["choice_id"], name: "index_user_choices_on_choice_id"
    t.index ["user_id"], name: "index_user_choices_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name", null: false
    t.string "email", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "choices", "diagnosis_questions"
  add_foreign_key "user_choices", "choices"
  add_foreign_key "user_choices", "users"
end
