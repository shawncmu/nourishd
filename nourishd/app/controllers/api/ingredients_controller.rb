class Api::IngredientsController < ApplicationController
  before_action :authenticate_current_user
end
