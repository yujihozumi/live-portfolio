class RegistrationsController < Devise::RegistrationsController
  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to root_path
    else
      render :edit
    end
  end

  private
  def user_params
    params.require(:user).permit(:name, :email, :avatar, :user_body)
  end
end
