module TimeSlotsHelper
  def day_string(day)
    Date::DAYNAMES[day]
  end
end
