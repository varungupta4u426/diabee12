class RemoveColumnsFromNutritionHistories < ActiveRecord::Migration[5.0]
  def change
  	remove_column :nutrition_histories, :confidence_diaterey_change, :boolean
  	remove_column :nutrition_histories, :motivation_diatery_change, :boolean
  	remove_column :nutrition_histories, :type_of_bevrages_drink_a_day, :string
  end
end
