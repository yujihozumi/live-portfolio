class UsersController < ApplicationController

  def show
    @user = User.find_by(id: params[:id])
  end

  def update
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
