json.id blog_posts.id 
json.title blog_posts.title
json.url blog_posts.url
json.subtitle blog_posts.subtitle
json.description blog_posts.description
json.blog blog_posts.data.blank? ? "https://www.youtube.com/watch?v=tv9_htvNFLU" : blog_posts.data
json.thumb blog_posts.data.blank? ? "http://i3.ytimg.com/vi/QxPuHJ5_ISg/hqdefault.jpg" : blog_posts.thumb
json.created_at blog_posts.created_at
json.type blog_posts.content_type