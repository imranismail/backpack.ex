defmodule Backpack.Moment do
  defdelegate add(value, opts), to: Backpack.Moment.Calculator

  defdelegate ago(value, seconds_or_unit \\ :seconds), to: Backpack.Moment.Calculator

  defdelegate from_now(value, seconds_or_unit \\ :seconds), to: Backpack.Moment.Calculator

  defdelegate minutes_ago(value, minutes), to: Backpack.Moment.Calculator

  defdelegate minute_ago(value, minutes), to: Backpack.Moment.Calculator, as: :minutes_ago

  defdelegate minutes_from_now(value, minutes), to: Backpack.Moment.Calculator

  defdelegate minute_from_now(value, minutes), to: Backpack.Moment.Calculator, as: :minutes_from_now

  defdelegate hours_ago(value, hours), to: Backpack.Moment.Calculator

  defdelegate hour_ago(value, hours), to: Backpack.Moment.Calculator, as: :hours_ago

  defdelegate hours_from_now(value, hours), to: Backpack.Moment.Calculator

  defdelegate hour_from_now(value, hours), to: Backpack.Moment.Calculator, as: :hours_from_now

  defdelegate days_ago(value, days), to: Backpack.Moment.Calculator

  defdelegate day_ago(value, days), to: Backpack.Moment.Calculator, as: :days_ago

  defdelegate days_from_now(value, days), to: Backpack.Moment.Calculator

  defdelegate day_from_now(value, days), to: Backpack.Moment.Calculator, as: :days_from_now

  defdelegate weeks_ago(value, weeks), to: Backpack.Moment.Calculator

  defdelegate week_ago(value, weeks), to: Backpack.Moment.Calculator, as: :weeks_ago

  defdelegate weeks_from_now(value, weeks), to: Backpack.Moment.Calculator

  defdelegate week_from_now(value, weeks), to: Backpack.Moment.Calculator, as: :weeks_from_now

  defdelegate months_ago(value, months), to: Backpack.Moment.Calculator

  defdelegate month_ago(value, months), to: Backpack.Moment.Calculator, as: :months_ago

  defdelegate months_from_now(value, months), to: Backpack.Moment.Calculator

  defdelegate month_from_now(value, months), to: Backpack.Moment.Calculator, as: :months_from_now

  defdelegate years_ago(value, years), to: Backpack.Moment.Calculator

  defdelegate year_ago(value, years), to: Backpack.Moment.Calculator, as: :years_ago

  defdelegate years_from_now(value, years), to: Backpack.Moment.Calculator

  defdelegate year_from_now(value, years), to: Backpack.Moment.Calculator, as: :years_from_now

  defdelegate beginning_of_day(value), to: Backpack.Moment.Calculator

  defdelegate end_of_day(value), to: Backpack.Moment.Calculator

  defdelegate beginning_of_week(value), to: Backpack.Moment.Calculator

  defdelegate end_of_week(value), to: Backpack.Moment.Calculator

  defdelegate beginning_of_month(value), to: Backpack.Moment.Calculator

  defdelegate end_of_month(value), to: Backpack.Moment.Calculator

  defdelegate beginning_of_quarter(value), to: Backpack.Moment.Calculator

  defdelegate end_of_quarter(value), to: Backpack.Moment.Calculator

  defdelegate beginning_of_year(value), to: Backpack.Moment.Calculator

  defdelegate end_of_year(value), to: Backpack.Moment.Calculator

  defdelegate yesterday(value), to: Backpack.Moment.Calculator

  defdelegate tomorrow(value), to: Backpack.Moment.Calculator

  defdelegate last_week(value), to: Backpack.Moment.Calculator

  defdelegate next_week(value), to: Backpack.Moment.Calculator

  defdelegate last_month(value), to: Backpack.Moment.Calculator

  defdelegate next_month(value), to: Backpack.Moment.Calculator

  defdelegate last_year(value), to: Backpack.Moment.Calculator

  defdelegate next_year(value), to: Backpack.Moment.Calculator

  defdelegate quarter(value), to: Backpack.Moment.Calculator

  defdelegate day_of_week(value), to: Backpack.Moment.Calculator

  defdelegate today?(value), to: Backpack.Moment.Calculator

  defdelegate future?(value), to: Backpack.Moment.Calculator

  defdelegate past?(value), to: Backpack.Moment.Calculator

  defdelegate years(num, unit \\ :seconds), to: Backpack.Moment.Numeric

  defdelegate year(num, unit \\ :seconds), to: Backpack.Moment.Numeric, as: :years

  defdelegate months(num, unit \\ :seconds), to: Backpack.Moment.Numeric

  defdelegate month(num, unit \\ :seconds), to: Backpack.Moment.Numeric, as: :months

  defdelegate weeks(num, unit \\ :seconds), to: Backpack.Moment.Numeric

  defdelegate week(num, unit \\ :seconds), to: Backpack.Moment.Numeric, as: :weeks

  defdelegate days(num, unit \\ :seconds), to: Backpack.Moment.Numeric

  defdelegate day(num, unit \\ :seconds), to: Backpack.Moment.Numeric, as: :days

  defdelegate hours(num, unit \\ :seconds), to: Backpack.Moment.Numeric

  defdelegate hour(num, unit \\ :seconds), to: Backpack.Moment.Numeric, as: :hours

  defdelegate minutes(num, unit \\ :seconds), to: Backpack.Moment.Numeric

  defdelegate minute(num, unit \\ :seconds), to: Backpack.Moment.Numeric, as: :minutes

  defdelegate seconds(num, unit \\ :seconds), to: Backpack.Moment.Numeric

  defdelegate second(num, unit \\ :seconds), to: Backpack.Moment.Numeric, as: :seconds

  defdelegate strftime(value, format, lang \\ :en), to: Calendar.Strftime

  defdelegate strftime!(value, format, lang \\ :en), to: Calendar.Strftime

  defdelegate from_unix(timestamp), to: DateTime

  defdelegate from_unix!(timestamp), to: DateTime
end
