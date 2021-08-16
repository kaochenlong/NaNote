class ApplicationController < ActionController::Base
	rescue_from ActiveRecord::RecordNotFound, with: :record_not_found

	helper_method :user_signed_in?, :current_user

	private

  def user_signed_in?
    session[:thankyou9527] != nil
  end

  def current_user
    if user_signed_in?
      User.find(session[:thankyou9527])
    else
      nil
    end
  end

	def check_login!
		if not user_signed_in?
			redirect_to "/users/sign_in"
		end
	end

	def record_not_found
		render file: "public/404.html", status: :not_found
	end
end
