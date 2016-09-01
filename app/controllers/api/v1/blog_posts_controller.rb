class Api::V1::BlogPostsController < ApplicationController

	def index
		@blog_posts = BlogPost.all
	end	
end
