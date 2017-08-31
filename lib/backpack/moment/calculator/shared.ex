defmodule Backpack.Moment.Calculator.Shared do
  def ago(value, seconds) do
    Backpack.Moment.Calculator.add(value, seconds: -seconds)
  end

  def from_now(value, seconds) do
    Backpack.Moment.Calculator.add(value, seconds: seconds)
  end

  def minutes_ago(value, minutes) do
    Backpack.Moment.Calculator.add(value, minutes: -minutes)
  end

  def minutes_from_now(value, minutes) do
    Backpack.Moment.Calculator.add(value, minutes: minutes)
  end

  def hours_ago(value, hours) do
    Backpack.Moment.Calculator.add(value, hours: -hours)
  end

  def hours_from_now(value, hours) do
    Backpack.Moment.Calculator.add(value, hours: hours)
  end

  def days_ago(value, days) do
    Backpack.Moment.Calculator.add(value, days: -days)
  end

  def days_from_now(value, days) do
    Backpack.Moment.Calculator.add(value, days: days)
  end

  def weeks_ago(value, weeks) do
    Backpack.Moment.Calculator.add(value, weeks: -weeks)
  end

  def weeks_from_now(value, weeks) do
    Backpack.Moment.Calculator.add(value, weeks: weeks)
  end

  def months_ago(value, months) do
    Backpack.Moment.Calculator.add(value, months: -months)
  end

  def months_from_now(value, months) do
    Backpack.Moment.Calculator.add(value, months: months)
  end

  def years_ago(value, years) do
    Backpack.Moment.Calculator.add(value, years: -years)
  end

  def years_from_now(value, years) do
    Backpack.Moment.Calculator.add(value, years: years)
  end

  def beginning_of_day(value) do
    value
    |> Map.put(:microsecond, {0, 6})
    |> Map.put(:second, 0)
    |> Map.put(:minute, 0)
    |> Map.put(:hour, 0)
  end

  def end_of_day(value) do
    value
    |> Map.put(:microsecond, {999999, 6})
    |> Map.put(:second, 59)
    |> Map.put(:minute, 59)
    |> Map.put(:hour, 23)
  end

  def beginning_of_week(value) do
    value
    |> Backpack.Moment.Calculator.add(days: -(Backpack.Moment.Calculator.day_of_week(value) - 1))
    |> beginning_of_day()
  end

  def end_of_week(value) do
    value
    |> Backpack.Moment.Calculator.add(days: 7 - Backpack.Moment.Calculator.day_of_week(value))
    |> end_of_day()
  end

  def beginning_of_month(value) do
    value
    |> Map.put(:day, 1)
    |> beginning_of_day()
  end

  def end_of_month(value) do
    {:ok, date} = Date.new(value.year, value.month, value.day)
    day = Date.days_in_month(date)

    value
    |> Map.put(:day, day)
    |> end_of_day()
  end

  def beginning_of_quarter(value) do
    case value.month do
      month when month in 1..3 ->
        value
        |> Map.put(:month, 1)
        |> beginning_of_month()
      month when month in 4..6 ->
        value
        |> Map.put(:month, 4)
        |> beginning_of_month()
      month when month in 7..9 ->
        value
        |> Map.put(:month, 7)
        |> beginning_of_month()
      month when month in 10..12 ->
        value
        |> Map.put(:month, 10)
        |> beginning_of_month()
    end
  end

  def end_of_quarter(value) do
    case value.month do
      month when month in 1..3 ->
        value
        |> Map.put(:month, 3)
        |> Backpack.Moment.Calculator.end_of_month()
      month when month in 4..6 ->
        value
        |> Map.put(:month, 6)
        |> Backpack.Moment.Calculator.end_of_month()
      month when month in 7..9 ->
        value
        |> Map.put(:month, 9)
        |> Backpack.Moment.Calculator.end_of_month()
      month when month in 10..12 ->
        value
        |> Map.put(:month, 12)
        |> Backpack.Moment.Calculator.end_of_month()
    end
  end

  def beginning_of_year(value) do
    value
    |> Map.put(:month, 1)
    |> beginning_of_month()
  end

  def end_of_year(value) do
    value
    |> Map.put(:month, 12)
    |> Backpack.Moment.Calculator.end_of_month()
  end

  def yesterday(value) do
    Backpack.Moment.Calculator.add(value, days: -1)
  end

  def tomorrow(value) do
    Backpack.Moment.Calculator.add(value, days: 1)
  end

  def last_week(value) do
    Backpack.Moment.Calculator.add(value, weeks: -1)
  end

  def next_week(value) do
    Backpack.Moment.Calculator.add(value, weeks: 1)
  end

  def last_month(value) do
    Backpack.Moment.Calculator.add(value, months: -1)
  end

  def next_month(value) do
    Backpack.Moment.Calculator.add(value, months: 1)
  end

  def last_year(value) do
    Backpack.Moment.Calculator.add(value, years: -1)
  end

  def next_year(value) do
    Backpack.Moment.Calculator.add(value, years: 1)
  end

  def quarter(value) do
    case value.month do
      month when month in 1..3   -> 1
      month when month in 4..6   -> 2
      month when month in 7..9   -> 3
      month when month in 10..12 -> 4
    end
  end

  def day_of_week(value) do
    Date.new(value.year, value.month, value.day)
    |> Date.day_of_week()
  end
end
