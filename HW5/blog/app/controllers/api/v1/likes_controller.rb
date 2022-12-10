class Api::V1::LikesController < ApplicationController
  def create
    @like = Like.create(like_params)

    render json: { like: @like }, status: :ok
  end

  def destroy
    @like = Like.find(params[:id]).destroy

    render json: { message: "Unliked" }
  end

  private

  def like_params
    params.require(:like).permit(:likeable_id, :likeable_type)
  end
end