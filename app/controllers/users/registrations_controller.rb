# frozen_string_literal: true

class Users::RegistrationsController < Devise::RegistrationsController
  # before_action :configure_sign_up_params, only: [:create]
  # before_action :configure_account_update_params, only: [:edit, :update]

  #GET /resource/sign_up
  def new
    super
  end

  #POST /resource
  def create
    super
  end

  #GET /resource/edit
  def edit    
    super
  end

#   #PUT /resource
  def update
    return if params[:user].blank?
    @user = User.find_by("email = ?", params[:user][:email])
    params[:user].delete(:current_password)

    if @user.update(user_params)
      flash[:notice] = 'User Updated Successfully'
      redirect_to edit_user_registration_path
    else
      flash[:error] = 'Unable to edit User'
      redirect_to edit_user_registration_path
    end
  end

#   #DELETE /resource
  # def destroy
  #   super
  # end

#   #GET /resource/cancel
#   #Forces the session data which is usually expired after sign
#   #in to be expired now. This is useful if the user wants to
#   #cancel oauth signing in/up in the middle of the process,
#   #removing all OAuth session data.
  def cancel
    super
  end

  private

  def user_params
    user_params = params.require(:user).permit(
      :first_name, :last_name,
      :email, :password,
      :password_confirmation,
      :image
    )

    # Remove the password and password confirmation keys for empty values
    if blank_password?(user_params)
      user_params.delete(:password)
      user_params
        .delete(:password_confirmation)
    end
    user_params
  end

  def blank_password?(user_params)
    user_params[:password].blank? ||
      user_params[:password_confirmation].blank?
  end
end
