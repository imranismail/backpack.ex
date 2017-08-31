defimpl Backpack.Moment.Calculator, for: Date do
  @time_unit_set MapSet.new([:hours, :minutes, :seconds, :milliseconds,
                             :microseconds, :nanoseconds])

  def add(value, opts) do
    if has_time_unit?(opts) do
      {:ok, date_time} = NaiveDateTime.new(value, ~T[00:00:00])
      Backpack.Moment.Calculator.add(date_time, opts)
    else
      sum_of_days =
        Keyword.get(opts, :years, 0) * 365
        |> Kernel.+(Keyword.get(opts, :months, 0) * 30)
        |> Kernel.+(Keyword.get(opts, :weeks, 0) * 7)
        |> Kernel.+(Keyword.get(opts, :days, 0))

      Date.add(value, sum_of_days)
    end
  end

  def today?(value) do
    Date.compare(value, Date.utc_today()) == :eq
  end

  def future?(value) do
    value
    |> Date.compare(Date.utc_today())
    |> Kernel.==(:gt)
  end

  def past?(value) do
    value
    |> Date.compare(Date.utc_today())
    |> Kernel.==(:lt)
  end

  defp has_time_unit?(opts) do
    opts_unit_set =
      opts
      |> Keyword.keys()
      |> MapSet.new()

    @time_unit_set
    |> MapSet.intersection(opts_unit_set)
    |> MapSet.size()
    |> Kernel.>(0)
  end

  defdelegate day_of_week(value), to: Date

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
