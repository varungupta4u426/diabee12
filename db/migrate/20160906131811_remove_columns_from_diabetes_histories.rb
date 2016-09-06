class RemoveColumnsFromDiabetesHistories < ActiveRecord::Migration[5.0]
  def change
  	remove_column :diabetes_histories, :previous_diabetes_education, :string
  	remove_column :diabetes_histories, :emergency_room_for_diabets_related_event, :string
  end
end
