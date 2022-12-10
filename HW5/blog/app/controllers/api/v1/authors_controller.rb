class Api::V1::AuthorsController < ApplicationController
  before_action :set_author, only: %i[show create update destroy]

  def create
    @author = Author.new(author_params)
    if @author.save
      render json: {  data: @author }, status: :ok
    else
      render json: @author.errors, status: :unprocessable_entity
    end
  end

  def author_index
    @author = Author.find_by_id(params[:author_id])
    @comment_author = @author.comments.all

    if @comment_author
      render json: @comment_author, status: :ok
    else
      render json: @comment_author.errors, status: :unprocessable_entity
    end
  end

  def index
    @authors = Author.all
    if @authors
      render json: { data: @authors }, status: :ok
    else
      render json: @authors.errors, status: :unprocessable_entity
    end
  end

  def show
    if @author
      render json: @author, status: :ok
    else
      render json: { message: "Not found" }
    end
  end

  def update
    if @author.update(author_params)
      render json: { data: @author }, status: :ok
    else
      render json: @author.errors, status: :unprocessable_entity
    end
  end

  def destroy
    if @author.destroy
      render json: { status: "Delete" }, status: :no_content
    else
      render json: @author.errors, status: :unprocessable_entity
    end
  end
end