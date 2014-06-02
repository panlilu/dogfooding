class AppointmentsController < ApplicationController
  def index
    @user = User.find(params[:user_id])
    cookies[:user] = @user.id
  end

  def dinner
    @user = User.find(params[:user_id])
    @app = @user.appointments.find(params[:appointment_id])
    raise if @app.at < Date.today

    @app.update_attribute(:dinner, @app.dinner.yes? ? :no : :yes)
    render :index
  end

  def lunch
    @user = User.find(params[:user_id])
    @app = @user.appointments.find(params[:appointment_id])
    raise if @app.at < Date.today

    @app.update_attribute(:lunch, @app.lunch.yes? ? :no : :yes)
    render :index
  end
end

