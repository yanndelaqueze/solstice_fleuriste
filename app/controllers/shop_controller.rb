class ShopController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :index]

  def index
    @products = Product.all
    @categories = Category.all
  end
end
