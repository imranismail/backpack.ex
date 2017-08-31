defmodule Backpack.Moment do
  defdelegate add(value, opts), to: Backpack.Moment.Calculator

  defdelegate ago(value, seconds_or_unit \\ :seconds), to: Backpack.Moment.Calculator

  defdelegate since(value, seconds_or_unit \\ :seconds), to: Backpack.Moment.Calculator

  defdelegate minutes_ago(value, minutes), to: Backpack.Moment.Calculator

  defdelegate minutes_since(value, minutes), to: Backpack.Moment.Calculator

  defdelegate hours_ago(value, hours), to: Backpack.Moment.Calculator

  defdelegate hours_since(value, hours), to: Backpack.Moment.Calculator

  defdelegate days_ago(value, days), to: Backpack.Moment.Calculator

  defdelegate days_since(value, days), to: Backpack.Moment.Calculator

  defdelegate weeks_ago(value, weeks), to: Backpack.Moment.Calculator

  defdelegate weeks_since(value, weeks), to: Backpack.Moment.Calculator

  defdelegate months_ago(value, months), to: Backpack.Moment.Calculator

  defdelegate months_since(value, months), to: Backpack.Moment.Calculator

  defdelegate years_ago(value, years), to: Backpack.Moment.Calculator

  defdelegate years_since(value, years), to: Backpack.Moment.Calculator

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
