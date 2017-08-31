defprotocol Backpack.Moment.Calculator do
  def add(value, opts)

  def ago(value, seconds)

  def since(value, seconds)

  def minutes_ago(value, minutes)

  def minutes_since(value, minutes)

  def hours_ago(value, hours)

  def hours_since(value, hours)

  def days_ago(value, days)

  def days_since(value, days)

  def weeks_ago(value, weeks)

  def weeks_since(value, weeks)

  def months_ago(value, months)

  def months_since(value, months)

  def years_ago(value, years)

  def years_since(value, years)

  def beginning_of_day(value)

  def end_of_day(value)

  def beginning_of_week(value)

  def end_of_week(value)

  def beginning_of_month(value)

  def end_of_month(value)

  def beginning_of_quarter(value)

  def end_of_quarter(value)

  def beginning_of_year(value)

  def end_of_year(value)

  def yesterday(value)

  def tomorrow(value)

  def last_week(value)

  def next_week(value)

  def last_month(value)

  def next_month(value)

  def last_year(value)

  def next_year(value)

  def quarter(value)

  def day_of_week(value)

  def today?(value)

  def future?(value)

  def past?(value)
end
