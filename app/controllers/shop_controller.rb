class ShopController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :index]

  def index
    @products = Product.all.order(position: :asc)
    @categories = Category.all.order(position: :asc)
  end
end
