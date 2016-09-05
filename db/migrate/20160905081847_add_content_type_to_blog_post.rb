class AddContentTypeToBlogPost < ActiveRecord::Migration[5.0]
  def change
    add_column :blog_posts, :content_type, :string
  end
end
