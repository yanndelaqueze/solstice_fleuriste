class ApplicationController < ActionController::Base
  include ApplicationHelper
  before_action :authenticate_user!

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
end
