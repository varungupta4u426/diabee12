class ChangeDoctorFromPatients < ActiveRecord::Migration[5.0]
  def change
  	remove_column :patients, :doctor_name, :string
  	add_reference :patients, :doctor, index: true
  end
end
