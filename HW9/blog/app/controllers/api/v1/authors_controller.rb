class Api::V1::AuthorsController < ApplicationController
  before_action :set_author, only: %i[show create update destroy]

  def index
    @authors = Author.all

    @pagy, @authors = pagy(@authors, items: 15)
    render json: @authors, status: :ok
end

  def show
    render json: @author, status: :ok
  end

  def create
    @author = Author.new(author_params)

    if @author.save
      render json: @author, status: :created
    else
      render json: @author.errors, status: :unprocessable_entity
    end
  end

  def update
    if @author.update(author_params)
      render json: @author, status: :ok
    else
      render json: @author.errors, status: :unprocessable_entity
    end
  end

  def destroy
    if @author.destroy
      head :no_content
    else
      render json: @author.errors, status: :unprocessable_entity
    end
  end

  private

  def set_author
    @author = Author.find(params[:id])
  end

  def author_params
    params.require(:author).permit(:name)
  end
end
