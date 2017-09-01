defimpl Backpack.Moment.Calculator, for: Integer do
  import Backpack.Moment.Numeric

  def add(term, opts) do
    term
    |> Kernel.+(years(Keyword.get(opts, :years, 0)))
    |> Kernel.+(months(Keyword.get(opts, :months, 0)))
    |> Kernel.+(weeks(Keyword.get(opts, :weeks, 0)))
    |> Kernel.+(days(Keyword.get(opts, :days, 0)))
    |> Kernel.+(hours(Keyword.get(opts, :hours, 0)))
    |> Kernel.+(minutes(Keyword.get(opts, :minutes, 0)))
    |> Kernel.+(seconds(Keyword.get(opts, :seconds, 0)))
    |> System.convert_time_unit(:nanoseconds, Keyword.get(opts, :unit, :nanoseconds))
  end

  def ago(term, unit \\ :nanoseconds) do
    System.system_time(unit) - term
  end

  def from_now(term, unit \\ :nanoseconds) do
    System.system_time(unit) + term
  end

  def minutes_ago(term, _minutes), do: undefined_error(term)

  def minutes_from_now(term, _minutes), do: undefined_error(term)

  def hours_ago(term, _hours), do: undefined_error(term)

  def hours_from_now(term, _hours), do: undefined_error(term)

  def days_ago(term, _days), do: undefined_error(term)

  def days_from_now(term, _days), do: undefined_error(term)

  def weeks_ago(term, _weeks), do: undefined_error(term)

  def weeks_from_now(term, _weeks), do: undefined_error(term)

  def months_ago(term, _months), do: undefined_error(term)

  def months_from_now(term, _months), do: undefined_error(term)

  def years_ago(term, _years), do: undefined_error(term)

  def years_from_now(term, _years), do: undefined_error(term)

  def beginning_of_day(term), do: undefined_error(term)

  def end_of_day(term), do: undefined_error(term)

  def beginning_of_week(term), do: undefined_error(term)

  def end_of_week(term), do: undefined_error(term)

  def beginning_of_month(term), do: undefined_error(term)

  def end_of_month(term), do: undefined_error(term)

  def beginning_of_quarter(term), do: undefined_error(term)

  def end_of_quarter(term), do: undefined_error(term)

  def beginning_of_year(term), do: undefined_error(term)

  def end_of_year(term), do: undefined_error(term)

  def yesterday(term), do: undefined_error(term)

  def tomorrow(term), do: undefined_error(term)

  def last_week(term), do: undefined_error(term)

  def next_week(term), do: undefined_error(term)

  def last_month(term), do: undefined_error(term)

  def next_month(term), do: undefined_error(term)

  def last_year(term), do: undefined_error(term)

  def next_year(term), do: undefined_error(term)

  def quarter(term), do: undefined_error(term)

  def day_of_week(term), do: undefined_error(term)

  def today?(term), do: undefined_error(term)

  def future?(term), do: undefined_error(term)

  def past?(term), do: undefined_error(term)

  defp undefined_error(term) do
    raise Protocol.UndefinedError, protocol: Backpack.Moment.Calculator, value: term
  end
end
