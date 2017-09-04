defprotocol Backpack.Moment.Calculator do
  def shift(value, opts)

  def ago(value, seconds)

  def from_now(value, seconds)

  def minutes_ago(value, minutes)

  def minutes_from_now(value, minutes)

  def hours_ago(value, hours)

  def hours_from_now(value, hours)

  def days_ago(value, days)

  def days_from_now(value, days)

  def weeks_ago(value, weeks)

  def weeks_from_now(value, weeks)

  def months_ago(value, months)

  def months_from_now(value, months)

  def years_ago(value, years)

  def years_from_now(value, years)

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
