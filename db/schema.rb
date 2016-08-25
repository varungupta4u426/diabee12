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

ActiveRecord::Schema.define(version: 20160825125606) do

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
  end

end
