class CreateNutritionHistoryEatOutPlaces < ActiveRecord::Migration[5.0]
  def change
    create_table :nutrition_history_eat_out_places do |t|
      t.references :nutrition_history, foreign_key: true
      t.references :eat_out_place, foreign_key: true

      t.timestamps
    end
  end
end
