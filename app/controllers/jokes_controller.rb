class JokesController < ApplicationController
  before_action :ensure_current_user
  
  def index
    render json: Joke.all, each_serializer: JokeSerializer
  end

  def create
    Joke.create(joke_params)
  end

  def show
    render json: Joke.where(id: params[:id]).first.to_json
  end

  def destroy
    @joke = Joke.where(id: params[:id]).first
    @joke.destroy

    head 204
  end

  private
    def joke_params
      params.permit(:body)
    end
end
