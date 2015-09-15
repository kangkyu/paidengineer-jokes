class SessionsController < ApplicationController
  def create
    user = User.authenticate(params[:email], params[:password])
    if user
      session = Session.create(token: SecureRandom.uuid, user_id: user.id)
      render json: session
    else
      render json: "400", status: 400
    end
  end
end

