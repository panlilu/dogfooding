module Admin
  class AdminController < AdminbaseController
    def users_report
      @report = UsersReport.new(params[:users_report]) do |scope|
        scope.page(params[:page])
      end

      respond_to do |format|
        format.csv { send_data @report.to_csv }
        format.html {}
      end
    end

    def appointments_report
      @user = User.find(params[:user_id])
      if (!@user)
        flash[:error]="Can't find user"
        redirect_to :back
      end
      
      @report = AppointmentsReport.new(params[:appointments_report]) do |scope|
        scope.where(:user_id => params[:user_id]).page(params[:page])
      end

      respond_to do |format|
        format.csv { send_data @report.to_csv }
        format.html {}
      end
    end
  end
end