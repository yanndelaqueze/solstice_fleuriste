class PaymentsController < ApplicationController
  def new
    @order = current_user.orders.where(status: 'En Attente de Paiement').find(params[:order_id])
  end
end
