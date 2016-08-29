class AddDoctorNameToPatients < ActiveRecord::Migration[5.0]
  def change
    add_column :patients, :doctor_name, :string
  end
end
