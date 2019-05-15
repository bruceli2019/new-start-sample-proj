class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)

    #note that && returns false if user == nil
    if(user && user.authenticate(params[:session][:password]))
      #then we login, log_in function within sessions_helper.rb
      #ApplicationController include SessionsHelper
      log_in(user)
      redirect_to user_url(user)
    else
      #show error message
      flash.now[:danger] = "Invalid login"
      render "new.html.erb"
    end

  end

  def destroy
  end
end
