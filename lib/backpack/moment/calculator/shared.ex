defmodule Backpack.Moment.Calculator.Shared do
  def ago(term, seconds) do
    Backpack.Moment.Calculator.shift(term, seconds: -seconds)
  end

  def from_now(term, seconds) do
    Backpack.Moment.Calculator.shift(term, seconds: seconds)
  end

  def minutes_ago(term, minutes) do
    Backpack.Moment.Calculator.shift(term, minutes: -minutes)
  end

  def minutes_from_now(term, minutes) do
    Backpack.Moment.Calculator.shift(term, minutes: minutes)
  end

  def hours_ago(term, hours) do
    Backpack.Moment.Calculator.shift(term, hours: -hours)
  end

  def hours_from_now(term, hours) do
    Backpack.Moment.Calculator.shift(term, hours: hours)
  end

  def days_ago(term, days) do
    Backpack.Moment.Calculator.shift(term, days: -days)
  end

  def days_from_now(term, days) do
    Backpack.Moment.Calculator.shift(term, days: days)
  end

  def weeks_ago(term, weeks) do
    Backpack.Moment.Calculator.shift(term, weeks: -weeks)
  end

  def weeks_from_now(term, weeks) do
    Backpack.Moment.Calculator.shift(term, weeks: weeks)
  end

  def months_ago(term, months) do
    Backpack.Moment.Calculator.shift(term, months: -months)
  end

  def months_from_now(term, months) do
    Backpack.Moment.Calculator.shift(term, months: months)
  end

  def years_ago(term, years) do
    Backpack.Moment.Calculator.shift(term, years: -years)
  end

  def years_from_now(term, years) do
    Backpack.Moment.Calculator.shift(term, years: years)
  end

  def beginning_of_day(term) do
    term
    |> Map.put(:microsecond, {0, 6})
    |> Map.put(:second, 0)
    |> Map.put(:minute, 0)
    |> Map.put(:hour, 0)
  end

  def end_of_day(term) do
    term
    |> Map.put(:microsecond, {999999, 6})
    |> Map.put(:second, 59)
    |> Map.put(:minute, 59)
    |> Map.put(:hour, 23)
  end

  def beginning_of_week(term) do
    term
    |> Backpack.Moment.Calculator.shift(days: -(Backpack.Moment.Calculator.day_of_week(term) - 1))
    |> beginning_of_day()
  end

  def end_of_week(term) do
    term
    |> Backpack.Moment.Calculator.shift(days: 7 - Backpack.Moment.Calculator.day_of_week(term))
    |> end_of_day()
  end

  def beginning_of_month(term) do
    term
    |> Map.put(:day, 1)
    |> beginning_of_day()
  end

  def end_of_month(term) do
    {:ok, date} = Date.new(term.year, term.month, term.day)
    day = Date.days_in_month(date)

    term
    |> Map.put(:day, day)
    |> end_of_day()
  end

  def beginning_of_quarter(term) do
    case term.month do
      month when month in 1..3 ->
        term
        |> Map.put(:month, 1)
        |> beginning_of_month()
      month when month in 4..6 ->
        term
        |> Map.put(:month, 4)
        |> beginning_of_month()
      month when month in 7..9 ->
        term
        |> Map.put(:month, 7)
        |> beginning_of_month()
      month when month in 10..12 ->
        term
        |> Map.put(:month, 10)
        |> beginning_of_month()
    end
  end

  def end_of_quarter(term) do
    case term.month do
      month when month in 1..3 ->
        term
        |> Map.put(:month, 3)
        |> Backpack.Moment.Calculator.end_of_month()
      month when month in 4..6 ->
        term
        |> Map.put(:month, 6)
        |> Backpack.Moment.Calculator.end_of_month()
      month when month in 7..9 ->
        term
        |> Map.put(:month, 9)
        |> Backpack.Moment.Calculator.end_of_month()
      month when month in 10..12 ->
        term
        |> Map.put(:month, 12)
        |> Backpack.Moment.Calculator.end_of_month()
    end
  end

  def beginning_of_year(term) do
    term
    |> Map.put(:month, 1)
    |> beginning_of_month()
  end

  def end_of_year(term) do
    term
    |> Map.put(:month, 12)
    |> Backpack.Moment.Calculator.end_of_month()
  end

  def yesterday(term) do
    Backpack.Moment.Calculator.shift(term, days: -1)
  end

  def tomorrow(term) do
    Backpack.Moment.Calculator.shift(term, days: 1)
  end

  def last_week(term) do
    Backpack.Moment.Calculator.shift(term, weeks: -1)
  end

  def next_week(term) do
    Backpack.Moment.Calculator.shift(term, weeks: 1)
  end

  def last_month(term) do
    Backpack.Moment.Calculator.shift(term, months: -1)
  end

  def next_month(term) do
    Backpack.Moment.Calculator.shift(term, months: 1)
  end

  def last_year(term) do
    Backpack.Moment.Calculator.shift(term, years: -1)
  end

  def next_year(term) do
    Backpack.Moment.Calculator.shift(term, years: 1)
  end

  def quarter(term) do
    case term.month do
      month when month in 1..3   -> 1
      month when month in 4..6   -> 2
      month when month in 7..9   -> 3
      month when month in 10..12 -> 4
    end
  end

  def day_of_week(term) do
    Date.new(term.year, term.month, term.day)
    |> Date.day_of_week()
  end
end
