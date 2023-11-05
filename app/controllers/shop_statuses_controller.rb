class ShopStatusesController < ApplicationController

  def new
    @shop_status = ShopStatus.new
  end

  def create
    ShopStatus.destroy_all
    @shop_status = ShopStatus.new(polygon_params)

    if @shop_status.save
      redirect_to admin_path, notice: 'Status de la Boutique mis à jour !'
    else
      render :new
    end
  end

  def update
    @shop_status = ShopStatus.last
    if @shop_status.update(shop_status_params)
      flash[:success] = "Status de la Boutique mis à jour !"
    else
      flash[:error] = "Echec"
    end
    redirect_to request.referrer
  end

  private

  def shop_status_params
    params.require(:shop_status).permit(:active, :message)
  end
end
