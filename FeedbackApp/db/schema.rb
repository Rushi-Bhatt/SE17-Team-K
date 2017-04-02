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

ActiveRecord::Schema.define(version: 20170401032756) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "courses", force: :cascade do |t|
    t.string   "course_number"
    t.string   "title"
    t.string   "level"
    t.integer  "department_id"
    t.integer  "professor_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.index ["department_id"], name: "index_courses_on_department_id", using: :btree
    t.index ["professor_id"], name: "index_courses_on_professor_id", using: :btree
  end

  create_table "departments", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "feedbacks", force: :cascade do |t|
    t.integer  "course_number"
    t.integer  "professor_id"
    t.integer  "user_id"
    t.integer  "num_of_exam"
    t.integer  "num_of_project"
    t.integer  "num_of_assignment"
    t.string   "tool_and_lang"
    t.integer  "fav_factor"
    t.integer  "prof_rating_id"
    t.integer  "job_relevance"
    t.integer  "workload"
    t.string   "grade"
    t.string   "related_course"
    t.integer  "quality_of_lecture"
    t.integer  "category"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
  end

  create_table "prof_ratings", force: :cascade do |t|
    t.integer  "professor_id"
    t.integer  "fluency"
    t.integer  "course_material"
    t.integer  "knowledge"
    t.integer  "doubt_solving"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  create_table "professors", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "reviews", force: :cascade do |t|
    t.integer  "course_id"
    t.integer  "user_id"
    t.text     "content"
    t.integer  "likes"
    t.integer  "dislikes"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["course_id"], name: "index_reviews_on_course_id", using: :btree
    t.index ["user_id"], name: "index_reviews_on_user_id", using: :btree
  end

  create_table "users", force: :cascade do |t|
    t.string   "name"
    t.string   "email"
    t.string   "password_digest"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
  end

  create_table "votes", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "review_id"
    t.integer  "like"
    t.integer  "dislike"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "courses", "departments"
  add_foreign_key "courses", "professors"
  add_foreign_key "reviews", "courses"
  add_foreign_key "reviews", "users"
end
