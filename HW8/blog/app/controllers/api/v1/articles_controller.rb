# frozen_string_literal: true

class Api::V1::ArticlesController < ApplicationController
  before_action :set_article, only: %i[show update destroy]

  def index
    @articles = @articles.search_title_and_body(params[:search]) if params[:search].present?

    @articles = @articles.filter_by_author(params[:author]) if params[:author].present?

    @articles = @articles.filter_by_tag(params[:tag]) if params[:tag].present?

    @articles = @articles.sort_title_by_asc_desc(params[:order]) if params[:order].present?

    @pagy, @articles = pagy(Article.order(created_at: :desc), items: 15)

    render json: @articles, status: :ok
  end

  def show
    render json: @article, each_serializer: ArticleSerializer
  end

  def create
    @article = Article.new(article_params)

    if @article.save
      render json: @article, status: :created
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
      head :no_content
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
