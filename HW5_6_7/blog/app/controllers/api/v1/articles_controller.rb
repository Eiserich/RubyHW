class Api::V1::ArticlesController < ApplicationController
  before_action :set_article, only: %i[show update destroy]

  def index
    @articles = Article.all
    if @articles
      render json: @articles, status: :ok
    else
      render json: @articles.errors, status: :unprocessable_entity
    end
  end

  def show
    @comments = Article.find(params[:id]).comments.last_ten_comments
    @tags = @article.tags

    render json: { article: @article, comments: @comments, tags: @tags }, status: :ok
  end

  def create
    @article = Article.new(article_params)

    if @article.save
      render json: { data: @article }, status: :created
    else
      render json: @article.errors, status: :unprocessable_entity
    end
  end

  def update
    if @article.update(article_params)
      render json: @article, status: :ok
    else
      render json: @article.errors, status: :unprocessable_entity
    end
  end

  def destroy
    if @article.destroy
      render json: { status: 'Delete' }, status: :no_content
    else
      render json: @article.errors, status: :unprocessable_entity
    end
  end

  private

  def set_article
    @article = Article.find(params[:id])
  end

  def article_params
    params.require(:article).permit(:title, :body)
  end
end
