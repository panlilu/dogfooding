class UsersReport

  include Datagrid

  scope do
    User
  end

  filter(:name, :string) {|value| where("name like '%#{value}%'")}
  filter(:team, :string)

  column(:name)
  column(:team)

  column(:eating_last_month) do |user|
    sum = 0
    start = (user.created_at > 1.month.ago.at_beginning_of_month) ? user.created_at.to_date : 1.month.ago.at_beginning_of_month
    ((start...1.month.ago.at_end_of_month).select{|d| (1..5).include?(d.wday) }).to_a.each do |x|
      app = Appointment.find_or_create_by!(user_id: user.id, at: x)
      if app.lunch.yes?
        sum+=1;
      end
      if app.dinner.yes?
        sum+=1;
      end
    end
    sum
  end

  column(:eating_this_month) do |user|
    sum = 0
    start = (user.created_at > Date.today.at_beginning_of_month) ? user.created_at.to_date : Date.today.at_beginning_of_month
    ((start...Date.today.at_end_of_month).select{|d| (1..5).include?(d.wday) }).to_a.each do |x|
      app = Appointment.find_or_create_by!(user_id: user.id, at: x)
      if app.lunch.yes?
        sum+=1;
      end
      if app.dinner.yes?
        sum+=1;
      end
    end
    sum
  end

  column(:actions) do |user|
    menu = ''
    menu << '<li><a href="/admin/appointments_report/'+user.id.to_s+'">查看详细</a></li>'
    content = '
<div class="btn-group">
  <button type="button" class="btn btn-xs btn-default dropdown-toggle" data-toggle="dropdown">
    Action <span class="caret"></span>
  </button>
  <ul class="dropdown-menu pull-right" role="menu">
    '+menu+'
  </ul>
</div>
    '

    content
  end

end