class ChangeColumnNameFromDiabetesHistory < ActiveRecord::Migration[5.0]
  def change
  	   rename_column :diabetes_histories, :type, :diabetes_type
  end
end
