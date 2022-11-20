class Api::V1::ArticlesController < ApplicationController
  def index
    articles = Article.all
    if articles
      render json: { status: "SUCCESS", message: "Fetched all articles successfully", data: articles }, status: :ok
    else
      render json: articles.errors, status: :bad_request
    end
  end

  def create
    article = Article.new(article_params)

    if article.save
      render json: { status: "SUCCESS", message: "Article was created successfully!", data: article }, status: :created
    else
      render json: article.errors, status: :unprocessable_entity
    end
  end

  private

  def article_params
    params.require(:article).permit(:title, :body)
  end

  # GET request
  def show
     article = Article.find(params[:id])

   if article
     render json: { data: article }, state: :ok
   else
     render json: { message: "Article could not be found" }, status: :bad_request
   end
  end

  #  DELETE request
  def destroy
    article = Article.find(params[:id])

    if article.destroy!
      render json: { message: "Article was deleted successfully" }, status: :ok
    else
      render json: { message: "Article does not exist" }, status: :bad_request
    end
  end

  # PATCH request
  def update
    article = Article.find(params[:id])

    if article.update!(article_params)
      render json: { message: "Article was updated successfully", data: article }, status: :ok
    else
      render json: { message: "Article cannot be updated" }, status: :unprocessable_entity
    end
  end
end
