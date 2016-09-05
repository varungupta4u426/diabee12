class AddProfilePicToCounsellors < ActiveRecord::Migration[5.0]
  def change
    add_column :counsellors, :profile_pic, :string
  end
end
