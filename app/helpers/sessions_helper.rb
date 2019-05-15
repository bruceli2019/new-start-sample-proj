module SessionsHelper

  def log_in(user)
    session[:user_id] = user.id
  end

  def current_user
    if session[:user_id] #if session[:user_id] not nil, this is true: check with !!session[:user_id]
      # ||= is the or/equals operator, like +=; returns @current_user if
      # @current_user not nil or false, otherwise evaluates the RHS and
      #sets @current_user equal to that
      @current_user ||= User.find_by(id: session[:user_id])
    end
  end

end
