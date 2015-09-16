class TagsController < ApplicationController
  before_action :ensure_current_user

  def create
    tag = Tag.new(tag_params)
    if tag.save
      render json: tag
    else
      render json: '400', status: 400
    end
  end

  def update
    tag = Tag.find(params[:id])
    if tag.update_attributes(tag_params)
      render json: tag
    else
      render json: '400', status: 400
    end
  end

  def destroy
    Tag.find(params[:id]).destroy
    head 204
  end

  private
    def tag_params
      params.permit(:joke_id, :tag)
    end
end

