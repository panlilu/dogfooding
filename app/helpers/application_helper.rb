module ApplicationHelper
  DATES = %w(Sun Mon Tues Wed Thur Fri Sat)
  def wday_to_s(i)
    DATES[i]
  end

  def yes_or_not(val)
    val == 1 ? 'YES' : 'NOT'
  end

  def all_user_count
    User.all.size
  end

  def today_dinner_count
    all_user_count - Appointment.with_dinner(:no).where(at: Date.today).size
  end

  def today_lunch_count
    all_user_count - Appointment.with_lunch(:no).where(at: Date.today).size
  end
end
