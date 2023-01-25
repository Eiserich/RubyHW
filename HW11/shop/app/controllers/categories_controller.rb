class CategoriesController < ApplicationController
  before_action :set_category, only: %i[show]

  def index
    @categories = Category.all
  end

  def show
    @products = @category.products
  end

  private

  def set_category
    @category = Category.find_by(id: params[:id])
  end

  def category_params
    params.require(:category).permit(:name, :description, :price, :image)
  end
end
