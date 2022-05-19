class Api::V1::UsersController < ApplicationController
  before_action :authenticate_user!
  def index
    if @current_user.present? && @current_user.role == "Admin"
      @users = User.all
        render json: { data: @users }
      else
        render json: { data: [] }
    end
  end
end
