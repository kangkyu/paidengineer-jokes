class UsersController < ApplicationController
  before_action :ensure_current_user

  def create
    user = User.new(user_params)
    if user.save
      render json: user.to_json
    else
      render json: '400'
    end
  end

  private

  def user_params
    params.permit(:email, :password)
  end
end