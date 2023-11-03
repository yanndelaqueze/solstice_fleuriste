class PaymentsController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :new]
  def new
    if user_signed_in?
      @order = current_user.orders.where(status: 'En Attente de Paiement').find(params[:order_id])
    else
      @order = current_order
    end
  end
end
