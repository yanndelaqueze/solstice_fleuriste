module ApplicationHelper
  def current_order
    # Check if there's an existing order stored in the session
    if session[:current_order_id]
      @current_order ||= Order.find_by(id: session[:current_order_id], status: "En cours")
    end
    # If no order exists in the session, create a new one
    if @current_order.nil?
      @current_order = Order.create
      session[:current_order_id] = @current_order.id
    end

    # If the user is signed in, retrieve their pending order
    if user_signed_in? && current_user.orders.find_by(status: "En Attente de Paiement").present?
      @current_order = current_user.orders.find_by(status: "En Attente de Paiement")
    elsif user_signed_in? && current_user.orders.find_by(status: "En cours").present?
      @current_order = current_user.orders.find_by(status: "En cours")
    end

    # If the user is signed in, associate the order with the user if there are order_items in it
    if user_signed_in? && @current_order.user.nil? && @current_order.order_items.present?
      @current_order.user = current_user
      @current_order.save
    end

    @current_order
  end
end
