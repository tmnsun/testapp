class HomeController < ApplicationController
  def index
  	@posts = Post.all
  end

  def disclaimer
  end
end
