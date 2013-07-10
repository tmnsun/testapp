class PostsController < ApplicationController
  def show
  	@post = Post.find_by_url!(params[:url])
  	@comment = Comment.new({:post_id => @post.id})
  end
end
