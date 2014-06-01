class UsersController < ApplicationController
  def new
    @user = User.new
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
end
