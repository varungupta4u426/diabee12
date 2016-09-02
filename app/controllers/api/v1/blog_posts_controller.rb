class Api::V1::BlogPostsController < ApplicationController

	def index
		p "****************"
		@blog_posts = BlogPost.paginate(:page => params[:page], :per_page => 5)
	end	


end
