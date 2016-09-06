class CreateDoctors < ActiveRecord::Migration[5.0]
  def change
    create_table :doctors do |t|
      t.string :title
      t.string :first_name
      t.string :last_name
      t.string :phone
      t.string :email
      t.string :address
      t.string :postal_code
      t.string :city
      t.string :state
      t.string :speciality
      t.string :attendant_name
      t.string :attendant_phone
      t.string :patient_prescribed

      t.timestamps
    end
  end
end
