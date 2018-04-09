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

ActiveRecord::Schema.define(version: 20180406162907) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "answers", force: :cascade do |t|
    t.text "respuesta"
    t.boolean "correcta"
    t.bigint "question_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "inciso"
    t.index ["question_id"], name: "index_answers_on_question_id"
  end

  create_table "questions", force: :cascade do |t|
    t.string "pregunta"
    t.bigint "quiz_type_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["quiz_type_id"], name: "index_questions_on_quiz_type_id"
  end

  create_table "quiz_types", force: :cascade do |t|
    t.string "nombre"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "quizzes", force: :cascade do |t|
    t.datetime "fecha_aplicacion"
    t.decimal "puntaje"
    t.bigint "quiz_type_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "user_id"
    t.integer "evaluator_id"
    t.index ["quiz_type_id"], name: "index_quizzes_on_quiz_type_id"
  end

  create_table "roles", force: :cascade do |t|
    t.string "nombre"
    t.text "descripcion"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "simulations", force: :cascade do |t|
    t.integer "obstaculos_derribados"
    t.integer "velocidad_excedida"
    t.integer "tiempo_simulacion"
    t.datetime "cita"
    t.datetime "fecha_aplicacion"
    t.bigint "quiz_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["quiz_id"], name: "index_simulations_on_quiz_id"
  end

  create_table "user_answers", force: :cascade do |t|
    t.bigint "quiz_id"
    t.bigint "question_id"
    t.bigint "answer_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["answer_id"], name: "index_user_answers_on_answer_id"
    t.index ["question_id"], name: "index_user_answers_on_question_id"
    t.index ["quiz_id"], name: "index_user_answers_on_quiz_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "nombre"
    t.string "ap_paterno"
    t.string "ap_materno"
    t.date "fecha_nacimiento"
    t.string "curp"
    t.string "email"
    t.string "password_digest"
    t.bigint "role_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["role_id"], name: "index_users_on_role_id"
  end

  add_foreign_key "answers", "questions"
  add_foreign_key "questions", "quiz_types"
  add_foreign_key "quizzes", "quiz_types"
  add_foreign_key "quizzes", "users"
  add_foreign_key "quizzes", "users", column: "evaluator_id"
  add_foreign_key "simulations", "quizzes"
  add_foreign_key "user_answers", "answers"
  add_foreign_key "user_answers", "questions"
  add_foreign_key "user_answers", "quizzes"
  add_foreign_key "users", "roles"
end
