class PolygonsController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :show]

  def show
    @polygon = Polygon.last
    @order = current_order
  end

  def index
    @polygons = Polygon.all
  end

  def new
    @polygon = Polygon.new
  end

  def create
    Polygon.destroy_all
    @polygon = Polygon.new(polygon_params)

    if @polygon.save
      redirect_to livraison_path, notice: 'Zone de Livraison définie !'
    else
      render :new
    end
  end

  private

  def polygon_params
    params.require(:polygon).permit(:coordinates)
  end

end
