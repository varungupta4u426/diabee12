class CreateMedicineFrequencyTimes < ActiveRecord::Migration[5.0]
  def change
    create_table :medicine_frequency_times do |t|
      t.string :medicine_time
      t.boolean :reminder_req
      t.references :medicine_frequency, foreign_key: true

      t.timestamps
    end
  end
end
