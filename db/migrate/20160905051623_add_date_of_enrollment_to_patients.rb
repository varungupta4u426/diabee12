class AddDateOfEnrollmentToPatients < ActiveRecord::Migration[5.0]
  def change
    add_column :patients, :date_of_enrollment, :date
  end
end
