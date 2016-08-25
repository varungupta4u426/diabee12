class AddColumnToPatient < ActiveRecord::Migration[5.0]
  def change
    add_column :patients, :username, :string
  end
end
