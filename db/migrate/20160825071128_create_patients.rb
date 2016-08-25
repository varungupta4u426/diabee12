class CreatePatients < ActiveRecord::Migration[5.0]
  def change
    create_table :patients do |t|
      t.string :email
      t.string :username
      t.string :password_digest
      t.string :mobile
      t.string :first_name
      t.string :last_name
      t.string :gender
      t.date :dob
      t.string :street_address
      t.string :city
      t.string :state
      t.string :pin
      t.string :ethnicity
      t.boolean :exercise
      t.string :smoke_drink
      t.boolean :disability
      t.string :preferred_language
      t.string :preferred_time_call_start
      t.string :preferred_time_call_end
      t.integer :height
      t.string :reason_for_non_enrollment
      t.date :date_of_dropout
      t.string :reason_for_dropout
      t.string :source
      t.string :nok_number
      t.string :nok_name
      t.string :nok_relation_with_patient
      t.string :access_token, limit: 128

      t.timestamps
    end
  end
end
