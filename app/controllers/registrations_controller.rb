class RegistrationsController < Devise::RegistrationsController

  protected

    def after_update_path_for(resource)
      compte_path
    end

end
