module UsersHelper
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
end
