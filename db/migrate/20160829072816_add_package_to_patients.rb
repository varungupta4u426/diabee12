class AddPackageToPatients < ActiveRecord::Migration[5.0]
  def change
    add_column :patients, :package, :string
  end
end
