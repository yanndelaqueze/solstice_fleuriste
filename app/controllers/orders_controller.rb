class OrdersController < ApplicationController
  before_action :set_order, only: %i[show edit update destroy]

  def index
    if current_user.admin
      @status_options = Order::STATUS
      @transport_options = Order::TRANSPORT
      @selected_status = params.dig(:filter, :status)
      @selected_transport = params.dig(:filter, :transport)

      # Starting with a base that includes all orders
      base = Order.all

      # Add filter conditions for "status" and "transport" if they are selected
      if @selected_status.present?
        base = base.where(status: @selected_status)
      end

      if @selected_transport.present?
        base = base.where(transport: @selected_transport)
      end

      # Finally, assign the filtered results to @orders
      @orders = base

    else
      @orders = current_user.orders
    end
  end

  def show
  end

  def edit
  end

  def update
    if @order.update(order_params)
      flash[:success] = "Commande mise à jour !!"
    else
      flash[:error] = "Oups, il y a eu un problème !"
    end
    redirect_to request.referer
  end

  def destroy
    @order.destroy
    redirect_to orders_path, status: :see_other
  end

  private

  def set_order
    # @order = Order.find(params[:id])
    @order = current_order
  end

  def order_params
    params.require(:order).permit(:delivery_address, :transport, :date, :delivery_instructions, :phone, :status)
  end
end
