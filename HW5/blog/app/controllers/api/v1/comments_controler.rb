class Api::V1::CommentsController < ApplicationController
  before_action :set_comment, only: %i[show update destroy status]

  def index
    @comments = Comment.all

    render json: @comments, status: :ok
  end

  def show
    render json: @comment, status: :ok
  end

  def published
    @comments = Comment.published_comments

    render json: @comments, status: :ok
  end

  def unpublished
    @comments = Comment.unpublished.comments

    render json: @comments, status: :ok
  end

  def create
    @comment = Comment.new(comment_params)

    if @comment.save
      render json: @comment, status: :ok
    else
      render json: @comment.errors, status: :unprocessable_entity
    end
  end

  def update
    if @comment.update(comment_params)
      render json: @comment, status: :ok
    else
      render json: @comment.errors, status: :unprocessable_entity
    end
  end

  def destroy
    if @comment.destroy
      render json: { status: "Delete" }, status: :no_content
    else
      render json: @comment.errors, status: :unprocessable_entity
    end
  end

  def status
    new_status = Comment.status == 'unpublished' ? 'published' : 'unpublished'
    @comments = Comment.update(status: new_status)

    render json: @comment, status: :ok
  end

  def last_ten_com
    @comments = Article.find(params[:article_id]).comments.ten_comments

    render json: @comments, status: :ok
  end

  private

  def set_comment
    @comment = Comment.find(params[:id])
  end

  def comment_params
    params.fetch(:comment, {})
  end
end