class Api::UsersController < ApplicationController
  before_action :authenticate_current_user
end
