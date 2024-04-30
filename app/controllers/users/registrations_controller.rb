# frozen_string_literal: true

module Users
  class RegistrationsController < Devise::RegistrationsController
    before_action :set_extra_params
    before_action :configure_sign_up_params, only: [:create] # rubocop:disable Rails/LexicallyScopedActionFilter

    # GET /resource/sign_up
    def new
      super do |resource|
        @extra_params.each do |param|
          resource[param] = params.fetch(param, nil)
        end
      end
    end

    protected

    def set_extra_params
      @extra_params = %i[first_name last_name gender birthdate height weight activity]
    end

    # If you have extra params to permit, append them to the sanitizer.
    def configure_sign_up_params
      devise_parameter_sanitizer.permit(:sign_up, keys: @extra_params)
    end
  end
end
