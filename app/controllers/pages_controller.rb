class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home, :delivery ]

  def home
  end

  def admin
  end

  def account
    @orders = current_user.orders
    @user = current_user
  end

  def my_orders
    @orders = current_user.orders
  end

  def delivery
    @polygon = Polygon.last
    @order = current_order
  end
end
