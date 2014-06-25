module ApplicationHelper
  DATES = %w(周日 周一 周二 周三 周四 周五 周六)
  def wday_to_s(i)
    DATES[i]
  end

  def yes_or_not(val)
    val == 1 ? '是' : '否'
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

  def tomorrow_dinner_count
    all_user_count - Appointment.with_dinner(:no).where(at: Date.tomorrow).size
  end

  def tomorrow_lunch_count
    all_user_count - Appointment.with_lunch(:no).where(at: Date.tomorrow).size
  end

end