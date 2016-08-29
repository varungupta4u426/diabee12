class AddProfileAndDoctorToPatients < ActiveRecord::Migration[5.0]
  def change
    # add_column :patients, :doctor_name, :string
    add_column :patients, :profile_pic, :string
  end
end
