class Api::V1::BlogPostsController < AppsController

	def index
		@blog_posts = BlogPost.paginate(:page => params[:page], :per_page => 5)
	end	


end
