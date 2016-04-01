class API::ChallengesController < ApplicationController
  # before_action :authenticate_current_user

  def participating_challenges
    @challenges = Challenge.where(participant_id: params[:id])
    respond_to do |format|
      format.json { render 'mychallenges.jbuilder' }
    end
  end

  def created_challenges
    @challenges = Challenge.where(creator_id: params[:id])
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

  # def update
  #   @recipe = Recipe.update(params[:id], edit_recipe_params)
  #   respond_to do |format|
  #     if @recipe.save
  #       format.json { render json: @recipe }
  #     else
  #       format.json { render json: @recipe.errors, status: :unprocessable_entity }
  #     end
  #   end
  # end

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
    params.permit(:recipe_id, :creator_id, :participant_id, :participant_status, :post_status)
  end

  # def edit_recipe_params
  #   params.require(:editRecipe).permit(:name, :instructions, :video_url, :cook_time, :serving, :course, :vegan, :gluten_free, :low_carb, :exp_value, :equipment, :dish_image, :ingredients_image)
  # end
end
