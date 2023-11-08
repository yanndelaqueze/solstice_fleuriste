class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home, :delivery, :cgv, :mentions_legales ]

  def home
  end

  def admin
    @shop_status = ShopStatus.last
  end

  def account
    @orders = current_user.orders
    @user = current_user
  end

  def delivery
    @polygon = delivery_area
    @order = current_order
  end

  def my_orders
    @orders = current_user.orders
  end

  def cgv
  end

  def mentions_legales
  end
end
