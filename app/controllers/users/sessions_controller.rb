# frozen_string_literal: true

class Users::SessionsController < Devise::SessionsController
  # before_action :configure_sign_in_params, only: [:create]

  # GET /resource/sign_in
  # def new
  #   super
  # end

  # POST /resource/sign_in
  # def create
  #   super do
  #     set_flash_message! :notice, :sign_in, user: "#{current_user.name} #{current_user.last_name}"
  #   end
  # end

  def create
    self.resource = warden.authenticate!(auth_options)
    set_flash_message! :notice, :sign_in, user: "#{current_user.name} #{current_user.last_name}"
    sign_in(resource_name, resource)
    current_user.is_a?(Admin) ? respond_with(:admin, location: admin_tests_path) : respond_with(@test, location: root_path)
  end

  # DELETE /resource/sign_out
  # def destroy
  #   super
  # end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  # end
end
