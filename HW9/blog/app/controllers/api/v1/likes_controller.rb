class Api::V1::LikesController < ApplicationController
  before_action :set_like, only: %i[show destroy]

  def index
    @likes = Like.all

    render json: @likes, status: :ok
  end

  def show
    render json: @like, status: :ok
  end

  def create
    @like = Like.create(like_params)

    render json: { like: @like }, status: :ok
  end

  def destroy
    @like = Like.find(params[:id]).destroy

    render json: { message: 'Unliked' }
  end

  private

  def like_params
    params.require(:like).permit(:likeable_id, :likeable_type)
  end
end
