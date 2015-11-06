class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(login: params[:session][:login])
    if user && user.authenticate(params[:session][:password])
      sign_in user
      redirect_to current_user
    else
      flash.now[:danger] = "Invalid login/password combination."
      render 'new'
    end
  end

  def destroy
    sign_out  
    redirect_to root_path
  end
end
