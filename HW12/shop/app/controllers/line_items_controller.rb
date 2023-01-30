# frozen_string_literal: true

class LineItemsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_line_item, only: %i[destroy update]

  def create
    product = Product.find(params[:product_id])
    current_cart.add_product(product)

    redirect_to cart_path, notice: "#{product.name} was successfully added to the cart"
  end

  def destroy
    set_line_item
    @line_item.destroy
    redirect_to cart_path
  end

  def update
    quantity = params[:act] == 'increase' ? @line_item.quantity + 1 : @line_item.quantity - 1
    @line_item.update(quantity: quantity)

    redirect_to cart_path
  end

  private

  def set_line_item
    @line_item = LineItem.find(params[:id])
  end
end
