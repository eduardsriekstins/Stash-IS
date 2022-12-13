class CommentsController < ApplicationController
  before_action :authenticate_user!

  def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.create(comment_parameters)
    @comment.user = current_user

    if @comment.save
      flash[:notice] = "Comment has been created"
      redirect_to post_path(@post)
    else
      flash[:notice] = "Comment has not been created"
      redirect_to post_path(@post)
    end
  end

  def destroy
    @post = Post.find(params[:post_id])
    @comment = @post.comments.find(params[:id])
    @comment.destroy
    redirect_to post_path(@post)
  end

  def update
    @post = Post.find(params[:post_id])
    @comment = @post.comments.find(params[:id])
    respond_to do |format|
      if @comment.update(comment_parameters)
        format.html { redirect_to post_path(@post), notice: "Comment has been updated!" }
      else 
        format.html {redirect_to post_path(@past), alert: "Comment has not been updated!"}
      end
    end
  end

  private
    def comment_parameters
      params.require(:comment).permit(:body)
    end


end
