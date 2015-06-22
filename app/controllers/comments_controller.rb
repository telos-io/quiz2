class CommentsController < ApplicationController

  def create
    @idea = Idea.find params[:idea_id]
    comment_params = params.require(:comment).permit(:body)
    @comment = Comment.new comment_params
    @comment.idea = @idea
    if @comment.save
      redirect_to idea_path(@idea), notice: "Comment created"
    else
      render "/post/show"
    end
  end

end
