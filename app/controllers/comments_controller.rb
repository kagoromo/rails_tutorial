class CommentsController < ApplicationController
  def create
    @micropost = Micropost.find(params[:micropost_id])
    @comment = @micropost.comments.build(comment_params)
    @comment.user_id = current_user.id
    if @comment.save
      flash[:success] = "Comment created!"
      redirect_to @micropost
    else
      render 'static_pages/home'
    end
  end

  def destroy
    @micropost = Micropost.find(params[:micropost_id])
    @comment = Comment.find(params[:id]).destroy
    flash[:success] = "Comment deleted"
    redirect_to @micropost
  end

  private
	def comment_params
		params.require(:comment).permit(:content)
	end
end