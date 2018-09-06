module Admins
  module V1
    module Auth
      #
      class RegistrationsController < DeviseTokenAuth::RegistrationsController
        # We need to overwrite the registrations controller because we added
        # a custom field, here we can modify the registration behaviours
        before_action :configure_permitted_parameters

        protected

        def configure_permitted_parameters
          devise_parameter_sanitizer.permit(:sign_up, keys: permitted)
        end

        def permitted
          [
            :name
          ]
        end
      end
    end
  end
end
