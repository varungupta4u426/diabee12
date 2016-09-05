class AddThumbToBlogPosts < ActiveRecord::Migration[5.0]
  def change
    add_column :blog_posts, :thumb, :string
  end
end
