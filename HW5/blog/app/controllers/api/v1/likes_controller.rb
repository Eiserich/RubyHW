class Api::V1::LikesController < ApplicationController
  def create
    @like = Like.new(like_params)
  end

  def destroy
    @like = Like.find(params[:id])
    @like.destroy
  end

  private

  def like_params
    params.require(:like).permit(:author_id)
  end
end