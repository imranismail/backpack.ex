defimpl Backpack.Moment.Calculator, for: DateTime do
  def add(value, opts) do
    value
    |> DateTime.to_naive()
    |> Backpack.Moment.Calculator.add(opts)
    |> DateTime.from_naive!(value.time_zone)
  end

  def today?(value) do
    value
    |> DateTime.to_date()
    |> Date.compare(Calendar.Date.today!(value.time_zone))
    |> Kernel.==(:eq)
  end

  def future?(value) do
    value
    |> DateTime.compare(Calendar.DateTime.now!(value.time_zone))
    |> Kernel.==(:gt)
  end

  def past?(value) do
    value
    |> DateTime.compare(Calendar.DateTime.now!(value.time_zone))
    |> Kernel.==(:lt)
  end

  defdelegate day_of_week(date), to: Backpack.Moment.Calculator.Shared

  defdelegate ago(value, seconds), to: Backpack.Moment.Calculator.Shared

  defdelegate since(value, seconds), to: Backpack.Moment.Calculator.Shared

  defdelegate minutes_ago(value, minutes), to: Backpack.Moment.Calculator.Shared

  defdelegate minutes_since(value, minutes), to: Backpack.Moment.Calculator.Shared

  defdelegate hours_ago(value, hours), to: Backpack.Moment.Calculator.Shared

  defdelegate hours_since(value, hours), to: Backpack.Moment.Calculator.Shared

  defdelegate days_ago(value, days), to: Backpack.Moment.Calculator.Shared

  defdelegate days_since(value, days), to: Backpack.Moment.Calculator.Shared

  defdelegate weeks_ago(value, weeks), to: Backpack.Moment.Calculator.Shared

  defdelegate weeks_since(value, weeks), to: Backpack.Moment.Calculator.Shared

  defdelegate months_ago(value, months), to: Backpack.Moment.Calculator.Shared

  defdelegate months_since(value, months), to: Backpack.Moment.Calculator.Shared

  defdelegate years_ago(value, years), to: Backpack.Moment.Calculator.Shared

  defdelegate years_since(value, years), to: Backpack.Moment.Calculator.Shared

  defdelegate beginning_of_day(value), to: Backpack.Moment.Calculator.Shared

  defdelegate end_of_day(value), to: Backpack.Moment.Calculator.Shared

  defdelegate beginning_of_week(value), to: Backpack.Moment.Calculator.Shared

  defdelegate end_of_week(value), to: Backpack.Moment.Calculator.Shared

  defdelegate beginning_of_month(value), to: Backpack.Moment.Calculator.Shared

  defdelegate end_of_month(value), to: Backpack.Moment.Calculator.Shared

  defdelegate beginning_of_quarter(value), to: Backpack.Moment.Calculator.Shared

  defdelegate end_of_quarter(value), to: Backpack.Moment.Calculator.Shared

  defdelegate beginning_of_year(value), to: Backpack.Moment.Calculator.Shared

  defdelegate end_of_year(value), to: Backpack.Moment.Calculator.Shared

  defdelegate yesterday(value), to: Backpack.Moment.Calculator.Shared

  defdelegate tomorrow(value), to: Backpack.Moment.Calculator.Shared

  defdelegate last_week(value), to: Backpack.Moment.Calculator.Shared

  defdelegate next_week(value), to: Backpack.Moment.Calculator.Shared

  defdelegate last_month(value), to: Backpack.Moment.Calculator.Shared

  defdelegate next_month(value), to: Backpack.Moment.Calculator.Shared

  defdelegate last_year(value), to: Backpack.Moment.Calculator.Shared

  defdelegate next_year(value), to: Backpack.Moment.Calculator.Shared

  defdelegate quarter(value), to: Backpack.Moment.Calculator.Shared
end
