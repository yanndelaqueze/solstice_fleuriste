class OrderItemsController < ApplicationController
  before_action :set_order_item, only: [:update, :destroy]
  skip_before_action :authenticate_user!, only: [ :create, :update, :destroy]

  def create
    @product = Product.find(params[:product_id])
    @order_item = OrderItem.new(order_item_params)
    @order_item.product = @product
    @order_item.order = current_order
    if @order_item.save
      redirect_to panier_path, notice: 'Produit ajouté au Panier !'
    else
      redirect_to product_path(@product), notice: 'Merci de remplir tous les champs'
    end
  end

  def update
    if @order_item.update(order_item_params)
      flash[:success] = "Article mis à jour"
    else
      flash[:error] = "Echec"
    end
    redirect_to panier_path
  end

  def destroy
    @order_item.destroy
    flash[:success] = "Article supprimé de votre panier"
    redirect_to panier_path
  end

  private

  def set_order_item
    @order_item = OrderItem.find(params[:id])
  end

  def order_item_params
    params.require(:order_item).permit(:price, :order_id, :product_id, :message, :color, :occasion)
  end
end
