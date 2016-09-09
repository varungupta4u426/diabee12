class AddEverHadConditionOtherToHealthHistory < ActiveRecord::Migration[5.0]
  def change
    add_column :health_histories, :ever_had_condition_other, :string
  end
end
