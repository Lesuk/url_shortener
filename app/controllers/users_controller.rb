class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      sign_in @user
      redirect_to @user
    else
      render 'new'
    end
  end

  def show 
    @link = current_user.links.build
    @links = current_user.links   
  end

  private

    def user_params
      params.require(:user).permit(:login, :password, :password_confirmation)
    end
end
