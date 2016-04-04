class API::CommentsController < ApplicationController
  def create
    @comment = Comment.new(new_comment_params)
    respond_to do |format|
      if @comment.save
        format.json { render 'newComment.jbuilder' }
      else
        format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
    end
  end

  private

  def new_comment_params
    params.permit(:user_id, :challenge_id, :comment)
  end
end
