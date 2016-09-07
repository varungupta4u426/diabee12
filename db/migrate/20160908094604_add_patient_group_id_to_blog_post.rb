class AddPatientGroupIdToBlogPost < ActiveRecord::Migration[5.0]
  def change
  	add_column :blog_posts, :patient_group_id, :integer
  end
end
