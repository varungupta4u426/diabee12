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

ActiveRecord::Schema.define(version: 20160829102057) do

  create_table "diabetes_histories", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "diabetes_type"
    t.string   "diagnosed_month"
    t.string   "diagnosed_year"
    t.boolean  "any_one_in_family_have_diabetes"
    t.string   "whome_have_diabetes_family"
    t.string   "previous_diabetes_education"
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
    t.string   "emergency_room_for_diabets_related_event"
    t.integer  "patient_id"
    t.datetime "created_at",                               null: false
    t.datetime "updated_at",                               null: false
    t.index ["patient_id"], name: "index_diabetes_histories_on_patient_id", using: :btree
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
    t.text     "listing_special_diet",               limit: 65535
    t.string   "dilated_eye_exam_month"
    t.string   "dilated_eye_exam_year"
    t.boolean  "seen_foot_doctor"
    t.string   "seen_foot_doctor_month"
    t.string   "seen_foot_doctor_year"
    t.boolean  "check_feet_daily"
    t.boolean  "drink_alcohol"
    t.string   "drinks_per_week_wine"
    t.string   "drinks_per_week_beer"
    t.string   "drinks_per_week_mixed"
    t.boolean  "do_you_smoke"
    t.string   "smoke_packs_per_day"
    t.string   "smoke_years"
    t.boolean  "ever_smoke"
    t.string   "smoke_quit"
    t.string   "alergies_any_othr_health_condition"
    t.integer  "patient_id"
    t.datetime "created_at",                                       null: false
    t.datetime "updated_at",                                       null: false
    t.index ["patient_id"], name: "index_health_histories_on_patient_id", using: :btree
  end

  create_table "nutrition_histories", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "height"
    t.string   "weight"
    t.boolean  "weight_chamge_last_year"
    t.string   "realistic_weight_for_you"
    t.string   "since_you_at_that_weight"
    t.integer  "confidence_diaterey_change"
    t.integer  "motivation_diatery_change"
    t.integer  "eat_out_for_breakfast_count"
    t.integer  "eat_out_for_lunch_count"
    t.integer  "eat_out_for_dinner_count"
    t.string   "places_eat_ot_at"
    t.string   "type_of_bevrages_drink_a_day"
    t.boolean  "eat_regular_meal"
    t.string   "eat_regular_meal_comment"
    t.boolean  "take_vitamin_mineral_diet_supplement"
    t.string   "take_vitamin_mineral_diet_supplement_type"
    t.boolean  "do_you_exercise_now"
    t.integer  "patient_id"
    t.datetime "created_at",                                null: false
    t.datetime "updated_at",                                null: false
    t.index ["patient_id"], name: "index_nutrition_histories_on_patient_id", using: :btree
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
    t.string   "doctor_name"
    t.string   "profile_pic"
    t.index ["reset_password_token"], name: "index_patients_on_reset_password_token", using: :btree
  end

  add_foreign_key "diabetes_histories", "patients"
  add_foreign_key "exercises", "nutrition_histories"
  add_foreign_key "health_histories", "patients"
  add_foreign_key "nutrition_histories", "patients"
end
