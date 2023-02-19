# frozen_string_literal: true

class CategoriesController < ApplicationController
  before_action :set_category, only: :show

  def index
    @categories = Category.all
  end

  def show
    @products = @category.products.with_attached_image
  end

  private

  def set_category
    @category = Category.find_by(id: params[:id])
  end

  def category_params
    params.require(:category).permit(:name, :description, :price, :image)
  end
end
