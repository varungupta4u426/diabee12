class AddSeenFootDoctorWhenToPatients < ActiveRecord::Migration[5.0]
  def change
    add_column :patients, :seen_foot_doctor, :date
  end
end
