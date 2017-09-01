defimpl Backpack.Moment.Calculator, for: DateTime do
  def add(term, opts) do
    term
    |> DateTime.to_naive()
    |> Backpack.Moment.Calculator.add(opts)
    |> DateTime.from_naive!(term.time_zone)
  end

  def today?(term) do
    term
    |> DateTime.to_date()
    |> Date.compare(Calendar.Date.today!(term.time_zone))
    |> Kernel.==(:eq)
  end

  def future?(term) do
    term
    |> DateTime.compare(Calendar.DateTime.now!(term.time_zone))
    |> Kernel.==(:gt)
  end

  def past?(term) do
    term
    |> DateTime.compare(Calendar.DateTime.now!(term.time_zone))
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
