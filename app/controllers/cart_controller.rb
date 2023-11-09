class CartController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :show]

  def show
    @order = current_order
    @order_items = current_order.order_items
  end
end
