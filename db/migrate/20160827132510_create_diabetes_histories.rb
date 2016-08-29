class CreateDiabetesHistories < ActiveRecord::Migration[5.0]
  def change
    create_table :diabetes_histories do |t|
      t.string :type
      t.string :diagnosed_month
      t.string :diagnosed_year
      t.boolean :any_one_in_family_have_diabetes
      t.string :whome_have_diabetes_family
      t.string :previous_diabetes_education
      t.string :own_words_diabetes
      t.string :intersting_learning_diabetes_session
      t.boolean :test_blood_sugar_at_home
      t.string :what_meter_use
      t.string :how_often_test_sugar
      t.string :how_often_test_sugar_other
      t.string :when_did_you_test
      t.string :when_did_you_test_other
      t.string :last_month_low_blood_sugar
      t.string :what_you_do_when_sugar_high
      t.string :what_you_do_when_sugar_low
      t.string :emergency_room_for_diabets_related_event
      t.references :patient, foreign_key: true

      t.timestamps
    end
  end
end
