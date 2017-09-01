defimpl Backpack.Moment.Calculator, for: NaiveDateTime do
  def add(term, opts) do
    sum = Backpack.Moment.Calculator.add(0, opts)

    term
    |> NaiveDateTime.add(sum, Keyword.get(opts, :unit, :nanoseconds))
    |> NaiveDateTime.add(Keyword.get(opts, :milliseconds, 0), :milliseconds)
    |> NaiveDateTime.add(Keyword.get(opts, :microseconds, 0), :microseconds)
    |> NaiveDateTime.add(Keyword.get(opts, :nanoseconds, 0), :nanoseconds)
  end

  def today?(term) do
    term
    |> NaiveDateTime.to_date()
    |> Date.compare(Date.utc_today())
    |> Kernel.==(:eq)
  end

  def future?(term) do
    term
    |> NaiveDateTime.compare(NaiveDateTime.utc_now())
    |> Kernel.==(:gt)
  end

  def past?(term) do
    term
    |> NaiveDateTime.compare(NaiveDateTime.utc_now())
    |> Kernel.==(:lt)
  end

  defdelegate day_of_week(date), to: Backpack.Moment.Calculator.Shared

  defdelegate ago(term, seconds), to: Backpack.Moment.Calculator.Shared

  defdelegate from_now(term, seconds), to: Backpack.Moment.Calculator.Shared

  defdelegate minutes_ago(term, minutes), to: Backpack.Moment.Calculator.Shared

  defdelegate minutes_from_now(term, minutes), to: Backpack.Moment.Calculator.Shared

  defdelegate hours_ago(term, hours), to: Backpack.Moment.Calculator.Shared

  defdelegate hours_from_now(term, hours), to: Backpack.Moment.Calculator.Shared

  defdelegate days_ago(term, days), to: Backpack.Moment.Calculator.Shared

  defdelegate days_from_now(term, days), to: Backpack.Moment.Calculator.Shared

  defdelegate weeks_ago(term, weeks), to: Backpack.Moment.Calculator.Shared

  defdelegate weeks_from_now(term, weeks), to: Backpack.Moment.Calculator.Shared

  defdelegate months_ago(term, months), to: Backpack.Moment.Calculator.Shared

  defdelegate months_from_now(term, months), to: Backpack.Moment.Calculator.Shared

  defdelegate years_ago(term, years), to: Backpack.Moment.Calculator.Shared

  defdelegate years_from_now(term, years), to: Backpack.Moment.Calculator.Shared

  defdelegate beginning_of_day(term), to: Backpack.Moment.Calculator.Shared

  defdelegate end_of_day(term), to: Backpack.Moment.Calculator.Shared

  defdelegate beginning_of_week(term), to: Backpack.Moment.Calculator.Shared

  defdelegate end_of_week(term), to: Backpack.Moment.Calculator.Shared

  defdelegate beginning_of_month(term), to: Backpack.Moment.Calculator.Shared

  defdelegate end_of_month(term), to: Backpack.Moment.Calculator.Shared

  defdelegate beginning_of_quarter(term), to: Backpack.Moment.Calculator.Shared

  defdelegate end_of_quarter(term), to: Backpack.Moment.Calculator.Shared

  defdelegate beginning_of_year(term), to: Backpack.Moment.Calculator.Shared

  defdelegate end_of_year(term), to: Backpack.Moment.Calculator.Shared

  defdelegate yesterday(term), to: Backpack.Moment.Calculator.Shared

  defdelegate tomorrow(term), to: Backpack.Moment.Calculator.Shared

  defdelegate last_week(term), to: Backpack.Moment.Calculator.Shared

  defdelegate next_week(term), to: Backpack.Moment.Calculator.Shared

  defdelegate last_month(term), to: Backpack.Moment.Calculator.Shared

  defdelegate next_month(term), to: Backpack.Moment.Calculator.Shared

  defdelegate last_year(term), to: Backpack.Moment.Calculator.Shared

  defdelegate next_year(term), to: Backpack.Moment.Calculator.Shared

  defdelegate quarter(term), to: Backpack.Moment.Calculator.Shared
end
