class API::UsersController < ApplicationController
  # before_action :authenticate_current_user
  def index
    @users = User.all
    respond_to do |format|
      format.json { render 'users.jbuilder' }
    end
  end
end
