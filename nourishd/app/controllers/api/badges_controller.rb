class Api::BadgesController < ApplicationController
  before_action :authenticate_current_user
end
