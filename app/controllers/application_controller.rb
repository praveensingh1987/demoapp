class ApplicationController < ActionController::Base
	# before_action :authenticate_user!
	before_action :configure_permitted_parameters, if: :devise_controller?

  def authenticate_user!
   current_user = User.find_by(api_token:  params[:api_token])
    @current_user = current_user
    unless @current_user
      render json: {status: {success: false}, message: "Permission denied"}, status: 401
    end
  end
	protected

	def configure_permitted_parameters      
    devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name, :email, :password, :password_confirmation, :user_name])
    devise_parameter_sanitizer.permit(:sign_in, keys: [:email, :password])
    devise_parameter_sanitizer.permit(:account_update, keys: [:first_name, :last_name, :email, :password, :password_confirmation, :user_name])
	end
end
