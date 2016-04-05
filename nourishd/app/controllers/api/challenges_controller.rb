class API::ChallengesController < ApplicationController
  # before_action :authenticate_current_user

  def index
    @user = User.find(params[:id])
    @challenges = Challenge.where(post_status: "complete")
    respond_to do |format|
      format.json { render 'allchallenges.jbuilder' }
    end
  end

  def allChallengesNoUser
    @challenges = Challenge.where(post_status: "complete")
    respond_to do |format|
      format.json { render 'allchallengesnouser.jbuilder' }
    end
  end

  def mychallenges
    @user = User.find(params[:id])
    @challenges = Challenge.where("participant_id = ? OR creator_id = ?", params[:id], params[:id])
    respond_to do |format|
      format.json { render 'mychallenges.jbuilder' }
    end
  end

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

  def destroy
    Challenge.destroy(params[:id])
    respond_to do |format|
      format.json { head :no_content }
    end
  end

  private

  def new_challenge_params
    params.permit(:recipe_id, :creator_id, :participant_id, :participant_acceptance, :participant_status, :creator_status, :post_status, :post_type, :creator_image)
  end

  def edit_challenge_params
    params.permit(:creator_image, :participant_image, :creator_status, :participant_status, :post_status, :participant_acceptance)
  end
end