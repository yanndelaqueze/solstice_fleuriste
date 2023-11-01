class OrdersController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :update]

  def index
    @status_options = ["En Attente de Paiement", "Payée", "En préparation", "Prête", "Livrée", "Annulée", "Remboursée"]
    @transport_options = Order::TRANSPORT
    @selected_status = params.dig(:filter, :status) || []  # Initialize as an empty array
    @selected_transport = params.dig(:filter, :transport)

    # Starting with a base that includes all orders (except "En Cours")
    if current_user.admin?
      base = Order.where(status: ["En Attente de Paiement", "Payée", "En préparation", "Prête", "Livrée", "Annulée", "Remboursée"]).order(date: :asc)
    else
      base = current_user.orders.where(status: ["En Attente de Paiement", "Payée", "En préparation", "Prête", "Livrée", "Annulée", "Remboursée"]).order(date: :asc)
    end

    # Add filter conditions for "status" and "transport" if they are selected
    if @selected_status.present?
      base = base.where(status: @selected_status).order(date: :asc)
    end

    if @selected_transport.present?
      base = base.where(transport: @selected_transport).order(date: :asc)
    end

    # Finally, assign the filtered results to @orders
    @orders = base.order(date: :asc)
  end

  def show
    @order = current_user.orders.find(params[:id])
    @order_items = @order.order_items
  end

  def edit
  end

  def update
    if Order.find(params[:id]).present?
      @order = Order.find(params[:id])
    else
      @order = current_order
    end

    @order_items = @order.order_items

    if @order.update(order_params)
      flash[:success] = "Commande mise à jour !!"
    else
      flash[:error] = "Oups, il y a eu un problème !"
    end
    redirect_to request.referrer
  end

  def destroy
    @order = Order.find(params[:id])
    @order.destroy
    redirect_to orders_path, status: :see_other
  end

  def validate
    @order = current_order
    @order.update(status: "En Attente de Paiement")
    @order.update(user_id: current_user.id)

    session = Stripe::Checkout::Session.create(
      payment_method_types: ['card'],
      line_items: [
        {
          price_data: {
            currency: "eur",
            unit_amount: @order.total_cents,
            product_data: {
              name: "Votre commande Solstice ##{@order.id}"
            },
          },
          quantity: 1,
        }
      ],
      mode: 'payment',
      success_url: order_url(@order),
      cancel_url: order_url(@order)
    )
    @order.update(checkout_session_id: session.id)
    redirect_to new_order_payment_path(@order)
  end

  private

  def order_params
    params.require(:order).permit(:delivery_address, :transport, :date, :delivery_instructions, :phone, :status, :delivery_first_name, :delivery_last_name )
  end
end
