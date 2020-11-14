class UsersController < ApplicationController
  before_action :authorized, only: [:show]
  
  def new
    @user = User.new
  end

  def create
    @user = User.create(user_params)
    if @user.valid?
      @user.save
      redirect_to root_path notice: 'Welcome!'
    else
      redirect :new
    end
  end

  def show
    @user = User.find(params[:id])
  end

  private

  def user_params
    params.require(:user).permit(:email, :username, :password, :password_confirmation)
  end
end
