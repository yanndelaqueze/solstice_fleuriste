class ApplicationController < ActionController::Base
  include ApplicationHelper
  before_action :authenticate_user!

  def after_sign_in_path_for(resource)
    panier_path
  end

  def after_sign_up_path_for(resource)
    panier_path
  end
end
