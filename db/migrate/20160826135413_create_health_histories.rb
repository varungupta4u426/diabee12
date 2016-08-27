class CreateHealthHistories < ActiveRecord::Migration[5.0]
  def change
    create_table :health_histories do |t|
      t.string :ever_had_condition
      t.boolean :follow_special_diet
      t.text :listing_special_diet
      t.string :dilated_eye_exam_month
      t.string :dilated_eye_exam_year
      t.boolean :seen_foot_doctor
      t.string :seen_foot_doctor_month
      t.string :seen_foot_doctor_year
      t.boolean :check_feet_daily
      t.boolean :drink_alcohol
      t.string :drinks_per_week_wine
      t.string :drinks_per_week_beer
      t.string :drinks_per_week_mixed
      t.boolean :do_you_smoke
      t.string :smoke_packs_per_day
      t.string :smoke_years
      t.boolean :ever_smoke
      t.string :smoke_quit
      t.string :alergies_any_othr_health_condition
      t.references :patient, foreign_key: true

      t.timestamps
    end
  end
end
