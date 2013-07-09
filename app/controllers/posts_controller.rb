class PostsController < ApplicationController
  def show
  	@post = Post.find_by_url!(params[:url])
  	@comment = @post.comments.build(params[:comment])
  end
end
