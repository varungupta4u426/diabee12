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

ActiveRecord::Schema.define(version: 20160908113924) do

  create_table "blog_posts", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "title"
    t.string   "subtitle"
    t.string   "url"
    t.string   "data"
    t.string   "description"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.string   "thumb"
    t.integer  "patient_group_id"
  end

  create_table "counsellors", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
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
    t.string   "first_name"
    t.string   "last_name"
    t.string   "speciality"
    t.string   "profile"
    t.string   "hcah_landline"
    t.string   "mobile"
    t.string   "role"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "profile_pic"
    t.index ["email"], name: "index_counsellors_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_counsellors_on_reset_password_token", unique: true, using: :btree
  end

  create_table "diabetes_histories", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "diabetes_type"
    t.string   "diagnosed_month"
    t.string   "diagnosed_year"
    t.boolean  "any_one_in_family_have_diabetes"
    t.string   "whome_have_diabetes_family"
    t.string   "own_words_diabetes"
    t.string   "intersting_learning_diabetes_session"
    t.boolean  "test_blood_sugar_at_home"
    t.string   "what_meter_use"
    t.string   "how_often_test_sugar"
    t.string   "how_often_test_sugar_other"
    t.string   "when_did_you_test"
    t.string   "when_did_you_test_other"
    t.string   "last_month_low_blood_sugar"
    t.string   "what_you_do_when_sugar_high"
    t.string   "what_you_do_when_sugar_low"
    t.integer  "patient_id"
    t.datetime "created_at",                             null: false
    t.datetime "updated_at",                             null: false
    t.boolean  "have_previous_diabets_education"
    t.string   "previous_diabetes_education_from_whome"
    t.integer  "test_blood_sugar_in_a_day"
    t.integer  "test_blood_sugar_in_a_week"
    t.boolean  "in_emergency_room_for_diabets"
    t.integer  "in_emergency_room_for_diabets_month"
    t.boolean  "have_you_been_pragnent"
    t.index ["patient_id"], name: "index_diabetes_histories_on_patient_id", using: :btree
  end

  create_table "doctors", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "title"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "phone"
    t.string   "email"
    t.string   "address"
    t.string   "postal_code"
    t.string   "city"
    t.string   "state"
    t.string   "speciality"
    t.string   "attendant_name"
    t.string   "attendant_phone"
    t.string   "patient_prescribed"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
  end

  create_table "eat_out_places", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "exercises", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "type_of_exercise"
    t.string   "amount_of_time"
    t.string   "times_per_weak"
    t.integer  "nutrition_history_id"
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
    t.index ["nutrition_history_id"], name: "index_exercises_on_nutrition_history_id", using: :btree
  end

  create_table "health_histories", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "ever_had_condition"
    t.boolean  "follow_special_diet"
    t.text     "listing_special_diet",        limit: 65535
    t.boolean  "seen_foot_doctor"
    t.string   "seen_foot_doctor_month"
    t.string   "seen_foot_doctor_year"
    t.boolean  "drink_alcohol"
    t.string   "drinks_per_week_wine"
    t.string   "drinks_per_week_beer"
    t.string   "drinks_per_week_mixed"
    t.boolean  "do_you_smoke"
    t.string   "smoke_packs_per_day"
    t.string   "smoke_years"
    t.boolean  "ever_smoke"
    t.string   "smoke_quit"
    t.integer  "patient_id"
    t.datetime "created_at",                                null: false
    t.datetime "updated_at",                                null: false
    t.date     "last_dialated_eye_exam_date"
    t.integer  "next_frequency_in_month"
    t.string   "check_your_feet"
    t.string   "drink_number_of_years"
    t.string   "food_alergies"
    t.string   "medicine_alergies"
    t.index ["patient_id"], name: "index_health_histories_on_patient_id", using: :btree
  end

  create_table "medicine_frequencies", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "dosage"
    t.integer  "frequency_of_days"
    t.integer  "frequency_in_a_day"
    t.integer  "medicine_id"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.index ["medicine_id"], name: "index_medicine_frequencies_on_medicine_id", using: :btree
  end

  create_table "medicine_frequency_times", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "medicine_time"
    t.boolean  "reminder_req"
    t.integer  "medicine_frequency_id"
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
    t.index ["medicine_frequency_id"], name: "index_medicine_frequency_times_on_medicine_frequency_id", using: :btree
  end

  create_table "medicines", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "name"
    t.integer  "patient_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["patient_id"], name: "index_medicines_on_patient_id", using: :btree
  end

  create_table "nutrition_histories", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "height"
    t.string   "weight"
    t.boolean  "weight_chamge_last_year"
    t.string   "realistic_weight_for_you"
    t.string   "since_you_at_that_weight"
    t.integer  "eat_out_for_breakfast_count"
    t.integer  "eat_out_for_lunch_count"
    t.integer  "eat_out_for_dinner_count"
    t.string   "places_eat_ot_at"
    t.boolean  "eat_regular_meal"
    t.string   "eat_regular_meal_comment"
    t.boolean  "take_vitamin_mineral_diet_supplement"
    t.string   "take_vitamin_mineral_diet_supplement_type"
    t.boolean  "do_you_exercise_now"
    t.integer  "patient_id"
    t.datetime "created_at",                                null: false
    t.datetime "updated_at",                                null: false
    t.date     "rate_motivation_confidence"
    t.integer  "beverages_drink_in_day_tea"
    t.integer  "beverages_drink_in_day_coffee"
    t.string   "beverages_drink_in_day_other"
    t.index ["patient_id"], name: "index_nutrition_histories_on_patient_id", using: :btree
  end

  create_table "parameters", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "patient_groups", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "patient_parameters", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "part_of_day"
    t.string   "time"
    t.string   "reading"
    t.date     "date_of_recall"
    t.integer  "patient_id"
    t.integer  "parameter_id"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.index ["parameter_id"], name: "index_patient_parameters_on_parameter_id", using: :btree
    t.index ["patient_id"], name: "index_patient_parameters_on_patient_id", using: :btree
  end

  create_table "patients", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "email"
    t.string   "password_digest"
    t.string   "mobile"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "gender"
    t.date     "dob"
    t.string   "street_address"
    t.string   "city"
    t.string   "state"
    t.string   "pin"
    t.string   "ethnicity"
    t.boolean  "exercise"
    t.string   "smoke_drink"
    t.boolean  "disability"
    t.string   "preferred_language"
    t.string   "preferred_time_call_start"
    t.string   "preferred_time_call_end"
    t.integer  "height"
    t.string   "reason_for_non_enrollment"
    t.date     "date_of_dropout"
    t.string   "reason_for_dropout"
    t.string   "source"
    t.string   "nok_number"
    t.string   "nok_name"
    t.string   "nok_relation_with_patient"
    t.string   "access_token",              limit: 128
    t.datetime "created_at",                            null: false
    t.datetime "updated_at",                            null: false
    t.string   "username"
    t.string   "reset_password_token"
    t.string   "package"
    t.string   "profile_pic"
    t.date     "date_of_enrollment"
    t.string   "preffered_day_for_call"
    t.date     "seen_foot_doctor"
    t.integer  "doctor_id"
    t.index ["doctor_id"], name: "index_patients_on_doctor_id", using: :btree
    t.index ["reset_password_token"], name: "index_patients_on_reset_password_token", using: :btree
  end

  add_foreign_key "diabetes_histories", "patients"
  add_foreign_key "exercises", "nutrition_histories"
  add_foreign_key "health_histories", "patients"
  add_foreign_key "medicine_frequencies", "medicines"
  add_foreign_key "medicine_frequency_times", "medicine_frequencies"
  add_foreign_key "medicines", "patients"
  add_foreign_key "nutrition_histories", "patients"
  add_foreign_key "patient_parameters", "parameters"
  add_foreign_key "patient_parameters", "patients"
end
