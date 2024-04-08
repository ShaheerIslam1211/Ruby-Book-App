# frozen_string_literal: true

module Users
  class SessionsController < Devise::SessionsController
    before_action :configure_sign_in_params, only: %i[create login]

    # GET /resource/sign_in

    # POST /resource/sign_in
    def create
      @user = User.find_by(email: params[:user][:email])

      if @user&.valid_password?(params[:user][:password])
        sign_in(@user)
        redirect_to root_path, notice: 'Logged in successfully.'
      else
        flash.now[:alert] = 'Invalid email or password.'
        render :new
      end
    end
    # def create
    #   super
    # end

    # DELETE /resource/sign_out

    protected

    # If you have extra params to permit, append them to the sanitizer.
    def configure_sign_in_params
      devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
    end
  end
end
