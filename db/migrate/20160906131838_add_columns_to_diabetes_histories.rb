class AddColumnsToDiabetesHistories < ActiveRecord::Migration[5.0]
  def change
  	add_column :diabetes_histories, :have_previous_diabets_education, :boolean
  	add_column :diabetes_histories, :previous_diabetes_education_from_whome, :string
  	add_column :diabetes_histories, :test_blood_sugar_in_a_day, :integer
  	add_column :diabetes_histories, :test_blood_sugar_in_a_week, :integer
  	add_column :diabetes_histories, :in_emergency_room_for_diabets, :boolean
  	add_column :diabetes_histories, :in_emergency_room_for_diabets_month, :integer
	add_column :diabetes_histories, :have_you_been_pragnent, :boolean
  end
end
