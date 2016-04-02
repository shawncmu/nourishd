class API::ChallengesController < ApplicationController
  # before_action :authenticate_current_user

  def mychallenges
    @user = User.find(params[:id])
    @challenges = Challenge.where("participant_id = ? OR creator_id = ?", params[:id], params[:id])
    # @creator_likes = Like.where()count
    # @participant_likes
    respond_to do |format|
      format.json { render 'mychallenges.jbuilder' }
    end
  end

  # def created_challenges
  #   @challenges = Challenge.where(creator_id: params[:id])
  #   respond_to do |format|
  #     format.json { render 'mychallenges.jbuilder' }
  #   end
  # end

  def show
    @challenge = Challenge.find(params[:id])
    respond_to do |format|
      format.json { render 'showonechallenge.jbuilder' }
    end
  end

  def create
    @challenge = Challenge.new(new_challenge_params)
    respond_to do |format|
      if @challenge.save
        format.json { render json: @challenge }
      else
        format.json { render json: @challenge.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    @challenge = Challenge.update(params[:id], edit_challenge_params)
    respond_to do |format|
      if @challenge.save
        format.json { render json: @challenge }
      else
        format.json { render json: @challenge.errors, status: :unprocessable_entity }
      end
    end
  end

  # def destroy
  #   Recipe.destroy(params[:id])
  #   # respond_to do |format|
  #   #   # format.html { redirect_to events_url, notice: 'Event was successfully destroyed.' }
  #   #   format.json { head :no_content }
  #   # end
  # end

  private

  # def completed_params
  #   params.require(:completedRecipe).permit(:notes, :user_id, :recipe_id, :completed_image)
  # end
  def new_challenge_params
    params.permit(:recipe_id, :creator_id, :participant_id, :participant_acceptance, :participant_status, :creator_status, :post_status, :post_type, :creator_image, :notes)
  end

  def edit_challenge_params
    params.permit(:creator_image, :participant_image, :creator_status, :participant_status, :post_status)
  end
end