class API::LikesController < ApplicationController

  def create
    @like = Like.new(new_like_params)
    respond_to do |format|
      if @like.save
        format.json { render json: @like }
      else
        format.json { render json: @like.errors, status: :unprocessable_entity }
      end
    end
  end

  private
    def new_like_params
      params.permit(:user_id, :challenge_id, :winner)
    end
end
