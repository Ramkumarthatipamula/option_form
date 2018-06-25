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

ActiveRecord::Schema.define(version: 20180623184624) do

  create_table "allotments", force: :cascade do |t|
    t.string   "student_name"
    t.string   "gender"
    t.integer  "rank"
    t.string   "college_name"
    t.boolean  "area"
    t.string   "category"
    t.string   "allotment"
    t.string   "s_allotment"
    t.string   "shifted_college"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  create_table "certificates", force: :cascade do |t|
    t.string   "certificate_no"
    t.string   "year_p"
    t.string   "month_p"
    t.string   "admission_year"
    t.string   "student_id"
    t.string   "student_name"
    t.string   "father_name"
    t.string   "mother_name"
    t.string   "aadhar_no"
    t.string   "academic_program"
    t.string   "degree_name"
    t.string   "college_name"
    t.string   "attachment"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
  end

  create_table "colleges", force: :cascade do |t|
    t.string   "name"
    t.string   "code"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "dmerits", force: :cascade do |t|
    t.string   "applicant_name"
    t.string   "application_number"
    t.string   "caste"
    t.string   "gender"
    t.string   "ht_number"
    t.text     "subjects"
    t.float    "c_cgpa_r"
    t.integer  "f_rank"
    t.string   "father_name"
    t.string   "mother_name"
    t.string   "mobile_number"
    t.text     "special"
    t.boolean  "area"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
  end

  create_table "dseats", force: :cascade do |t|
    t.string   "code"
    t.boolean  "area"
    t.integer  "oc_g"
    t.integer  "oc_w"
    t.integer  "a_g"
    t.integer  "a_w"
    t.integer  "b_g"
    t.integer  "b_w"
    t.integer  "c_g"
    t.integer  "c_w"
    t.integer  "d_g"
    t.integer  "d_w"
    t.integer  "e_g"
    t.integer  "e_w"
    t.integer  "f_g"
    t.integer  "f_w"
    t.integer  "g_g"
    t.integer  "g_w"
    t.integer  "t_g"
    t.integer  "t_w"
    t.integer  "tot"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "academic_program"
    t.string   "degree_name"
    t.string   "college_name"
    t.string   "admission_year"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

end
