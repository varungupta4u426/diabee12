class AddColumnToPatients < ActiveRecord::Migration[5.0]
  def change
    add_column :patients, :reset_password_token, :string
    add_index  :patients, :reset_password_token
  end
end
