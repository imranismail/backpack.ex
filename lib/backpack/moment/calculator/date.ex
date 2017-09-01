defimpl Backpack.Moment.Calculator, for: Date do
  @time_unit_set MapSet.new([:hours, :minutes, :seconds, :milliseconds,
                             :microseconds, :nanoseconds])

  def add(term, opts) do
    if has_time_unit?(opts) do
      {:ok, date_time} = NaiveDateTime.new(term, ~T[00:00:00.0000000])
      Backpack.Moment.Calculator.add(date_time, opts)
    else
      sum_of_days =
        Keyword.get(opts, :years, 0) * 365
        |> Kernel.+(Keyword.get(opts, :months, 0) * 30)
        |> Kernel.+(Keyword.get(opts, :weeks, 0) * 7)
        |> Kernel.+(Keyword.get(opts, :days, 0))

      Date.add(term, sum_of_days)
    end
  end

  def today?(term) do
    Date.compare(term, Date.utc_today()) == :eq
  end

  def future?(term) do
    term
    |> Date.compare(Date.utc_today())
    |> Kernel.==(:gt)
  end

  def past?(term) do
    term
    |> Date.compare(Date.utc_today())
    |> Kernel.==(:lt)
  end

  def beginning_of_day(term) do
    {:ok, date_time} = NaiveDateTime.new(term, ~T[00:00:00.000000])
    Backpack.Moment.Calculator.beginning_of_day(date_time)
  end

  def end_of_day(term) do
    {:ok, date_time} = NaiveDateTime.new(term, ~T[00:00:00.000000])
    Backpack.Moment.Calculator.end_of_day(date_time)
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

  defdelegate day_of_week(term), to: Date

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
