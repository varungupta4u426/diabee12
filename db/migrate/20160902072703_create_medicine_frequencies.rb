class CreateMedicineFrequencies < ActiveRecord::Migration[5.0]
  def change
    create_table :medicine_frequencies do |t|
      t.string :dosage
      t.integer :frequency_of_days
      t.integer :frequency_in_a_day
      t.references :medicine, foreign_key: true

      t.timestamps
    end
  end
end
