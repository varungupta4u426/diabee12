class CreatePatientParameters < ActiveRecord::Migration[5.0]
  def change
    create_table :patient_parameters do |t|
      t.string :part_of_day
      t.string :time
      t.string :reading
      t.date :date_of_recall
      t.references :patient, foreign_key: true
      t.references :parameter, foreign_key: true

      t.timestamps
    end
  end
end
