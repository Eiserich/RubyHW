class Api::V1::ArticlesController < ApplicationController
  before_action :set_article, only: %i[show update destroy]

  # GET articles
  def index
    @articles = Article.all
    if @articles
      render json: { data: @articles }
    else
      render json: @articles.errors
    end
  end

  # GET articles/1
  def show
    @comments = Article.find(params[:id]).comments

    render json: { data: @article, comments: @comments }
  end

  def create
    @article = Article.new(article_params)

    if @article.save
      render json: { data: @article }
    else
      render json: @article.errors
    end
  end

  # PATCH/PUT articles/1
  def update
    if @article.update(article_params)
      render json: @article
    else
      render json: @article.errors
    end
  end

  # DELETE articles/1
  def destroy
    if @article.destroy
      render json: { status: "Delete" }
    else
      render json: @article.errors
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_article
    @article = Article.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def article_params
    params.require(:article).permit(:title, :body)
  end
end