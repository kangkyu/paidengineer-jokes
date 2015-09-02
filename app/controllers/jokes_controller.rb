class JokesController < ApplicationController
  before_action :ensure_current_user

  def index
    render json: Joke.all, each_serializer: JokeSerializer
  end

  def create
    Joke.create(params[:joke])
  end

  def show
    render json: Joke.where(id: params[:id]).first.to_json
  end
end
