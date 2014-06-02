class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def index
    if @user = User.find_by_id(cookies[:user])
      redirect_to user_appointments_path(@user)
    end
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:notice] = 'CREATE DONE'
    else
      flash[:alert] = 'CREATE FAIL'
    end
    redirect_to action: :new
  end

  def user_params
    params.require(:user).permit(:name, :team)
  end

  def destroy
    cookies[:user] = nil
    redirect_to action: :index
  end
end
