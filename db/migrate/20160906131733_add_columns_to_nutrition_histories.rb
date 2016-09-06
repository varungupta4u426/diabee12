class AddColumnsToNutritionHistories < ActiveRecord::Migration[5.0]
  def change
  	add_column :nutrition_histories, :rate_motivation_confidence, :date
  	add_column :nutrition_histories, :beverages_drink_in_day_tea, :integer
  	add_column :nutrition_histories, :beverages_drink_in_day_coffee, :integer
  	add_column :nutrition_histories, :beverages_drink_in_day_other, :string
  end
end
