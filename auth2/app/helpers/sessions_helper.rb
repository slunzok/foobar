# Helper methods defined here can be accessed in any controller or view in the application

Auth2.helpers do

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end
end
