class ApplicationController < ActionController::Base
  include ApplicationHelper
  before_action :authenticate_user!
  before_action :assign_orders
  before_action :configure_permitted_parameters, if: :devise_controller?

  before_action do
    I18n.locale = :fr
  end

  def after_sign_in_path_for(_resource)
    if user_signed_in? && current_user.admin?
      admin_path
    elsif user_signed_in? && current_order.order_items.present?
      panier_path
    else
      creations_path
    end
  end

  def after_sign_up_path_for(_resource)
    if user_signed_in? && current_user.admin?
      admin_path
    elsif user_signed_in? && current_order.order_items.present?
      panier_path
    else
      creations_path
    end
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:account_update, keys: [:first_name, :last_name, :address, :phone])
    devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name, :address, :phone])
  end

  def assign_orders
    if user_signed_in?
      @found_orders = Order.where(email: current_user.email, user_id: nil)
      @found_orders.each do |order|
        order.update(user_id: current_user.id)
        order.save
      end
    end
  end

end
