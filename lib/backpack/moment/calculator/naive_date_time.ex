defimpl Backpack.Moment.Calculator, for: NaiveDateTime do
  def add(value, opts) do
    sum = Backpack.Moment.Calculator.add(0, opts)

    value
    |> NaiveDateTime.add(sum, Keyword.get(opts, :unit, :nanoseconds))
    |> NaiveDateTime.add(Keyword.get(opts, :milliseconds, 0), :milliseconds)
    |> NaiveDateTime.add(Keyword.get(opts, :microseconds, 0), :microseconds)
    |> NaiveDateTime.add(Keyword.get(opts, :nanoseconds, 0), :nanoseconds)
  end

  def today?(value) do
    value
    |> NaiveDateTime.to_date()
    |> Date.compare(Date.utc_today())
    |> Kernel.==(:eq)
  end

  def future?(value) do
    value
    |> NaiveDateTime.compare(NaiveDateTime.utc_now())
    |> Kernel.==(:gt)
  end

  def past?(value) do
    value
    |> NaiveDateTime.compare(NaiveDateTime.utc_now())
    |> Kernel.==(:lt)
  end

  defdelegate day_of_week(date), to: Backpack.Moment.Calculator.Shared

  defdelegate ago(value, seconds), to: Backpack.Moment.Calculator.Shared

  defdelegate from_now(value, seconds), to: Backpack.Moment.Calculator.Shared

  defdelegate minutes_ago(value, minutes), to: Backpack.Moment.Calculator.Shared

  defdelegate minutes_from_now(value, minutes), to: Backpack.Moment.Calculator.Shared

  defdelegate hours_ago(value, hours), to: Backpack.Moment.Calculator.Shared

  defdelegate hours_from_now(value, hours), to: Backpack.Moment.Calculator.Shared

  defdelegate days_ago(value, days), to: Backpack.Moment.Calculator.Shared

  defdelegate days_from_now(value, days), to: Backpack.Moment.Calculator.Shared

  defdelegate weeks_ago(value, weeks), to: Backpack.Moment.Calculator.Shared

  defdelegate weeks_from_now(value, weeks), to: Backpack.Moment.Calculator.Shared

  defdelegate months_ago(value, months), to: Backpack.Moment.Calculator.Shared

  defdelegate months_from_now(value, months), to: Backpack.Moment.Calculator.Shared

  defdelegate years_ago(value, years), to: Backpack.Moment.Calculator.Shared

  defdelegate years_from_now(value, years), to: Backpack.Moment.Calculator.Shared

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
