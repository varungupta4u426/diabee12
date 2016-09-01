json.result true
json.status SUCCESS_CODE
json.object do
	json.partial! "blog_posts",collection: @blog_posts,as: :blog_posts
end

