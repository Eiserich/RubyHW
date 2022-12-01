class Api::V1::CommentsController < ApplicationController
  before_action :set_comment, only: %i[show update destroy status]

  # GET comments
  def index
    @comments = Comment.all

    render json: @comments
  end

  # GET comments/1
  def show
    render json: @comment
  end

  # GET comments/published
  def published
    @comments = Comment.published_comments

    render json: @comments, only: %i[id body author_id.name article_id updated_at]
  end

  # GET comments/unpublished
  def unpublished
    @comments = Comment.unpublished.comments

    render json: @comments, only: %i[id body author_id article_id updated_at]
  end

  # POST comments
  def create
    @comment = Comment.new(comment_params)

    if @comment.save
      render json: @comment, status: :created
    else
      render json: @comment.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /comments/1
  def update
    if @comment.update(comment_params)
      render json: @comment
    else
      render json: @comment.errors, status: :unprocessable_entity
    end
  end

  # DELETE comments/1
  def destroy
    @comment.destroy
  end

  # GET comments/1/switch_status
  def status
    new_status = Comment.status == 'unpublished' ? 'published' : 'unpublished'
    @comments = Comment.update(status: character)

    render json: @comment
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_comment
    @comment = Comment.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def comment_params
    params.fetch(:comment, {})
  end
end