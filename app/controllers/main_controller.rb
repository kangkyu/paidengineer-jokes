class MainController < ApplicationController
  def ping
    render json: {
      responses: [
        {
          pong: true
        }
      ]
    }
  end
end
