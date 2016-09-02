class CreateMedicines < ActiveRecord::Migration[5.0]
  def change
    create_table :medicines do |t|
      t.string :name
      t.references :patient, foreign_key: true

      t.timestamps
    end
  end
end
