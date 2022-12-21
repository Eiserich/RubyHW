class Api::V1::TagsController < ApplicationController
  before_action :set_tag, only: %i[show update destroy]

  def index
    @tags = Tag.all

    render json: @tags, status: :ok
  end

  def show
    render json: @tag, status: :ok
  end

  def create
    @tag = Tag.new(tag_params)

    if @tag.save
      render json: @tag, status: :created
    else
      render json: @tag.errors, status: :unprocessable_entity
    end
  end

  def update
    if @tag.update(tag_params)
      render json: @tag, status: :ok
    else
      render json: @tag.errors, status: :unprocessable_entity
    end
  end

  def destroy
    if @tag.destroy
      render json: { status: 'Delete' }, status: :no_content
    else
      render json: @tag.errors, status: :unprocessable_entity
    end
  end

  private

  def set_tag
    @tag = Tag.find(params[:id])
  end
  
  def tag_params
    params.require(:tag).permit(:name)
  end
end
