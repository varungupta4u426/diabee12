class RemoveContentTypeFromBlogPost < ActiveRecord::Migration[5.0]
  def change
  	remove_column :blog_posts, :content_type
  end
end
