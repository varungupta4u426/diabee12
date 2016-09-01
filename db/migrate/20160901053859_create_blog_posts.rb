class CreateBlogPosts < ActiveRecord::Migration[5.0]
  def change
    create_table :blog_posts do |t|
      t.string :title
      t.string :subtitle
      t.string :url
      t.string :data
      t.string :description

      t.timestamps
    end
  end
end
