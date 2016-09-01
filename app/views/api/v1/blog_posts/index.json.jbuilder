json.result true
json.status SUCCESS_CODE
json.blog_posts do
	json.partial! "blog_posts",blog_posts: @blog_posts
end