class AddPrefferedDayForCallToPatients < ActiveRecord::Migration[5.0]
  def change
  	 add_column :patients, :preffered_day_for_call, :string
  end
end
