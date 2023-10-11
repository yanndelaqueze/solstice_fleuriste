class ProductsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:show]
  before_action :set_product, only: %i[show edit update destroy]

  def index
    @products = Product.all.order(position: :asc)
  end

  def show
    @order_item = OrderItem.new
  end

  def new
    @categories = Category.all
    @product = Product.new
  end

  def create
    @categories = Category.all
    @product = Product.new(product_params)
    @product.category_id = params[:product][:category_id]
    if @product.save
      redirect_to category_path(@product.category), notice: 'Product was successfully created'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    # Check for removed images
    if params[:product][:remove_image].present?
      params[:product][:remove_image].each do |image_id|
        @product.photos.find(image_id).purge
      end
    end

    # Attach new images
    if params[:product][:new_images].present?
      params[:product][:new_images].each do |image|
        @product.photos.attach(image)
      end
    end
    if @product.update(product_params)
      redirect_to category_path(@product.category), notice: 'Product was successfully updated'
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @product.destroy
    redirect_to request.referrer || root_url
  end

  private

  def set_product
    @product = Product.find(params[:id])
  end

  def product_params
    params.require(:product).permit(:name, :description, :min_price, :available, :position, :category_id)
  end
end
