# frozen_string_literal: true

class LineItemsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_line_item, only: %i[destroy update]

  def create
    product = Product.find(params[:product_id])
    @line_item = current_cart.line_items.find_by(product: product)
    if @line_item.present?
      @line_item.update(quantity: @line_item.quantity + 1)
    else
      @line_item = current_cart.line_items.create(product: product)
    end

    respond_to do |format|
      format.html { redirect_to line_item_path(id: @line_item.id) }
      format.turbo_stream
    end
  end

  def destroy
    set_line_item
    @line_item.destroy
    redirect_to cart_path
  end

  def update
    quantity = params[:act] == 'increase' ? @line_item.quantity + 1 : @line_item.quantity - 1
    @line_item.update(quantity: quantity)

    respond_to do |format|
      format.html { redirect_to cart_path }
      format.turbo_stream
    end
  end

  private

  def set_line_item
    @line_item = LineItem.find(params[:id])
  end
end
