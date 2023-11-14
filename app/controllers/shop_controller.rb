class ShopController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :index]

  def index
    @all_categories = Category.joins(:products)
                              .where(display: true)
                              .group('categories.id')
                              .having('COUNT(products.id) > 0')
                              .order(position: :asc)

    if params[:filter] && params[:filter][:category_ids].present?
      @selected_category_ids = params[:filter][:category_ids].map(&:to_i)
      @categories = Category.where(id: @selected_category_ids)
    else
      @categories = @all_categories
      @selected_category_ids = []
    end
  end
end
