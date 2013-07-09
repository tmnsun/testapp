class CommentsController < ApplicationController
  before_action :authenticate_user!

  def create
    @comment = post.comments.build(params[:comment].permit(:body))
    authorize! :create, @comment
    @comment.user = current_user
    respond_to do |format|
      format.html {
        if @comment.save
          redirect_to(post, notice: "Комментарий добавлен")
        else
          render "posts/show"
        end
      }
      format.js {
        @comment.save
      }
    end
  end

  def update
    @comment = post.comments.find(params[:id])
    authorize! :update, @comment
    respond_to do |format|
      if @comment.update_attributes(params[:comment])
        format.html { redirect_to(admin_comments_path, :notice => 'Comment was successfully updated.') }
        format.js
      else
        format.html { render "posts/show" }
        format.js
      end
    end
  end

  def destroy
    @comment = post.comments.find(params[:id])
    authorize! :delete, @comment
    @comment.destroy
    respond_to do |format|
      format.html { redirect_to(post, notice: "Комментарий удален")}
      format.js
    end
  end

  private

  def post
    @post ||= Post.find_by_url(params[:post_id])
  end
end



