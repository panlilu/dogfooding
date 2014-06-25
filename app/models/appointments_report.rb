class AppointmentsReport

  include Datagrid
  include ActionView::Helpers

  scope do
    Appointment.order('at desc')
  end

  filter(:at, :date,:range => true,:default => proc { [1.month.ago.to_date, Date.today] } )

  column(:at)

  DATES = %w(周日 周一 周二 周三 周四 周五 周六)
  column(:day) do |app|
     DATES[app.at.wday]
  end
  column(:dinner)
  column(:lunch)

end