class Auth::RegistrationsController < DeviseTokenAuth::RegistrationsControlle
  private

  def sign_up_params
    params.permit(:name, :email, :password, :password_confirmation)
  end
end
