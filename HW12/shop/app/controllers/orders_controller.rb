# frozen_string_literal: true

class OrdersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_order, only: %i[show destroy pay]

  def index
    @orders = current_user.orders
  end

  def show; end

  def create
    @order = current_user.orders.create(cart: current_cart)
    redirect_to order_path(@order), notice: 'Order was successfully created'
  end

  def destroy
    @order.destroy
    redirect_to orders_path
  end

  def pay
    @order.paid!
    redirect_to orders_path, notice: 'Order was paid successfully'
  end

  private

  def set_order
    @order = current_user.orders.find(params[:id])
  end
end
