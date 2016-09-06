class AddColumnsToHealthHistories < ActiveRecord::Migration[5.0]
  def change
  	add_column :health_histories, :last_dialated_eye_exam_date, :date
    add_column :health_histories, :next_frequency_in_month, :integer
    add_column :health_histories, :check_your_feet, :string
    add_column :health_histories, :drink_number_of_years, :string
    add_column :health_histories, :food_alergies, :string
    add_column :health_histories, :medicine_alergies, :string
  end
end
