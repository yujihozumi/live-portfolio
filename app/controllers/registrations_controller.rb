class RegistrationsController < Devise::RegistrationsController
  def update
    @user.update(user_params)
  end

  private
  def user_params
    params.require(:user).permit(:name, :email, :avatar, :user_body)
  end
end
