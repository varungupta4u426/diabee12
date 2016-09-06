class RemoveColumnFromHealthHistories < ActiveRecord::Migration[5.0]
  def change
  	remove_column :health_histories, :dilated_eye_exam_month, :string
    remove_column :health_histories, :dilated_eye_exam_year, :string
    remove_column :health_histories, :check_feet_daily, :boolean
    remove_column :health_histories, :alergies_any_othr_health_condition, :string
  end
end
