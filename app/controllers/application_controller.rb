class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :set_search

  def set_search
    @q = Post.ransack(params[:q])
    @posts = @q.result(distinct: true)
  end

  protected
    def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :avatar, :user_body])
      devise_parameter_sanitizer.permit(:account_update, keys: [:name, :avatar, :user_body])
    end
end
