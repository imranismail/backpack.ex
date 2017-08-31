defimpl Backpack.Moment.Calculator, for: Integer do
  import Backpack.Moment.Numeric

  def add(value, opts) do
    value
    |> Kernel.+(years(Keyword.get(opts, :years, 0)))
    |> Kernel.+(months(Keyword.get(opts, :months, 0)))
    |> Kernel.+(weeks(Keyword.get(opts, :weeks, 0)))
    |> Kernel.+(days(Keyword.get(opts, :days, 0)))
    |> Kernel.+(hours(Keyword.get(opts, :hours, 0)))
    |> Kernel.+(minutes(Keyword.get(opts, :minutes, 0)))
    |> Kernel.+(seconds(Keyword.get(opts, :seconds, 0)))
    |> System.convert_time_unit(:seconds, Keyword.get(opts, :unit, :seconds))
  end

  def ago(value, unit \\ :seconds) do
    System.system_time(unit) - value
  end

  def since(value, unit \\ :seconds) do
    System.system_time(unit) + value
  end

  def minutes_ago(value, _minutes), do: undefined_error(value)

  def minutes_since(value, _minutes), do: undefined_error(value)

  def hours_ago(value, _hours), do: undefined_error(value)

  def hours_since(value, _hours), do: undefined_error(value)

  def days_ago(value, _days), do: undefined_error(value)

  def days_since(value, _days), do: undefined_error(value)

  def weeks_ago(value, _weeks), do: undefined_error(value)

  def weeks_since(value, _weeks), do: undefined_error(value)

  def months_ago(value, _months), do: undefined_error(value)

  def months_since(value, _months), do: undefined_error(value)

  def years_ago(value, _years), do: undefined_error(value)

  def years_since(value, _years), do: undefined_error(value)

  def beginning_of_day(value), do: undefined_error(value)

  def end_of_day(value), do: undefined_error(value)

  def beginning_of_week(value), do: undefined_error(value)

  def end_of_week(value), do: undefined_error(value)

  def beginning_of_month(value), do: undefined_error(value)

  def end_of_month(value), do: undefined_error(value)

  def beginning_of_quarter(value), do: undefined_error(value)

  def end_of_quarter(value), do: undefined_error(value)

  def beginning_of_year(value), do: undefined_error(value)

  def end_of_year(value), do: undefined_error(value)

  def yesterday(value), do: undefined_error(value)

  def tomorrow(value), do: undefined_error(value)

  def last_week(value), do: undefined_error(value)

  def next_week(value), do: undefined_error(value)

  def last_month(value), do: undefined_error(value)

  def next_month(value), do: undefined_error(value)

  def last_year(value), do: undefined_error(value)

  def next_year(value), do: undefined_error(value)

  def quarter(value), do: undefined_error(value)

  def day_of_week(value), do: undefined_error(value)

  def today?(value), do: undefined_error(value)

  def future?(value), do: undefined_error(value)

  def past?(value), do: undefined_error(value)

  defp undefined_error(value) do
    raise Protocol.UndefinedError, protocol: Backpack.Moment.Calculator, value: value
  end
end