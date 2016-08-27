class CreateNutritionHistories < ActiveRecord::Migration[5.0]
  def change
    create_table :nutrition_histories do |t|
      t.integer :height
      t.string :weight
      t.boolean :weight_chamge_last_year
      t.string :realistic_weight_for_you
      t.string :since_you_at_that_weight
      t.integer :confidence_diaterey_change
      t.integer :motivation_diatery_change
      t.integer :eat_out_for_breakfast_count
      t.integer :eat_out_for_lunch_count
      t.integer :eat_out_for_dinner_count
      t.string :places_eat_ot_at
      t.string :type_of_bevrages_drink_a_day
      t.boolean :eat_regular_meal
      t.string :eat_regular_meal_comment
      t.boolean :take_vitamin_mineral_diet_supplement
      t.string :take_vitamin_mineral_diet_supplement_type
      t.boolean :do_you_exercise_now
      t.references :patient, foreign_key: true

      t.timestamps
    end
  end
end
