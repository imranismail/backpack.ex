defmodule Backpack.Moment do
  defdelegate add(term, opts), to: Backpack.Moment.Calculator

  defdelegate ago(term, seconds_or_unit \\ :nanoseconds), to: Backpack.Moment.Calculator

  defdelegate from_now(term, seconds_or_unit \\ :nanoseconds), to: Backpack.Moment.Calculator

  defdelegate minutes_ago(term, minutes), to: Backpack.Moment.Calculator

  defdelegate minute_ago(term, minutes), to: Backpack.Moment.Calculator, as: :minutes_ago

  defdelegate minutes_from_now(term, minutes), to: Backpack.Moment.Calculator

  defdelegate minute_from_now(term, minutes), to: Backpack.Moment.Calculator, as: :minutes_from_now

  defdelegate hours_ago(term, hours), to: Backpack.Moment.Calculator

  defdelegate hour_ago(term, hours), to: Backpack.Moment.Calculator, as: :hours_ago

  defdelegate hours_from_now(term, hours), to: Backpack.Moment.Calculator

  defdelegate hour_from_now(term, hours), to: Backpack.Moment.Calculator, as: :hours_from_now

  defdelegate days_ago(term, days), to: Backpack.Moment.Calculator

  defdelegate day_ago(term, days), to: Backpack.Moment.Calculator, as: :days_ago

  defdelegate days_from_now(term, days), to: Backpack.Moment.Calculator

  defdelegate day_from_now(term, days), to: Backpack.Moment.Calculator, as: :days_from_now

  defdelegate weeks_ago(term, weeks), to: Backpack.Moment.Calculator

  defdelegate week_ago(term, weeks), to: Backpack.Moment.Calculator, as: :weeks_ago

  defdelegate weeks_from_now(term, weeks), to: Backpack.Moment.Calculator

  defdelegate week_from_now(term, weeks), to: Backpack.Moment.Calculator, as: :weeks_from_now

  defdelegate months_ago(term, months), to: Backpack.Moment.Calculator

  defdelegate month_ago(term, months), to: Backpack.Moment.Calculator, as: :months_ago

  defdelegate months_from_now(term, months), to: Backpack.Moment.Calculator

  defdelegate month_from_now(term, months), to: Backpack.Moment.Calculator, as: :months_from_now

  defdelegate years_ago(term, years), to: Backpack.Moment.Calculator

  defdelegate year_ago(term, years), to: Backpack.Moment.Calculator, as: :years_ago

  defdelegate years_from_now(term, years), to: Backpack.Moment.Calculator

  defdelegate year_from_now(term, years), to: Backpack.Moment.Calculator, as: :years_from_now

  defdelegate beginning_of_day(term), to: Backpack.Moment.Calculator

  defdelegate end_of_day(term), to: Backpack.Moment.Calculator

  defdelegate beginning_of_week(term), to: Backpack.Moment.Calculator

  defdelegate end_of_week(term), to: Backpack.Moment.Calculator

  defdelegate beginning_of_month(term), to: Backpack.Moment.Calculator

  defdelegate end_of_month(term), to: Backpack.Moment.Calculator

  defdelegate beginning_of_quarter(term), to: Backpack.Moment.Calculator

  defdelegate end_of_quarter(term), to: Backpack.Moment.Calculator

  defdelegate beginning_of_year(term), to: Backpack.Moment.Calculator

  defdelegate end_of_year(term), to: Backpack.Moment.Calculator

  defdelegate yesterday(term), to: Backpack.Moment.Calculator

  defdelegate tomorrow(term), to: Backpack.Moment.Calculator

  defdelegate last_week(term), to: Backpack.Moment.Calculator

  defdelegate next_week(term), to: Backpack.Moment.Calculator

  defdelegate last_month(term), to: Backpack.Moment.Calculator

  defdelegate next_month(term), to: Backpack.Moment.Calculator

  defdelegate last_year(term), to: Backpack.Moment.Calculator

  defdelegate next_year(term), to: Backpack.Moment.Calculator

  defdelegate quarter(term), to: Backpack.Moment.Calculator

  defdelegate day_of_week(term), to: Backpack.Moment.Calculator

  defdelegate today?(term), to: Backpack.Moment.Calculator

  defdelegate future?(term), to: Backpack.Moment.Calculator

  defdelegate past?(term), to: Backpack.Moment.Calculator

  defdelegate years(term, unit \\ :nanoseconds), to: Backpack.Moment.Numeric

  defdelegate year(term, unit \\ :nanoseconds), to: Backpack.Moment.Numeric, as: :years

  defdelegate months(term, unit \\ :nanoseconds), to: Backpack.Moment.Numeric

  defdelegate month(term, unit \\ :nanoseconds), to: Backpack.Moment.Numeric, as: :months

  defdelegate weeks(term, unit \\ :nanoseconds), to: Backpack.Moment.Numeric

  defdelegate week(term, unit \\ :nanoseconds), to: Backpack.Moment.Numeric, as: :weeks

  defdelegate days(term, unit \\ :nanoseconds), to: Backpack.Moment.Numeric

  defdelegate day(term, unit \\ :nanoseconds), to: Backpack.Moment.Numeric, as: :days

  defdelegate hours(term, unit \\ :nanoseconds), to: Backpack.Moment.Numeric

  defdelegate hour(term, unit \\ :nanoseconds), to: Backpack.Moment.Numeric, as: :hours

  defdelegate minutes(term, unit \\ :nanoseconds), to: Backpack.Moment.Numeric

  defdelegate minute(term, unit \\ :nanoseconds), to: Backpack.Moment.Numeric, as: :minutes

  defdelegate seconds(term, unit \\ :nanoseconds), to: Backpack.Moment.Numeric

  defdelegate second(term, unit \\ :nanoseconds), to: Backpack.Moment.Numeric, as: :seconds

  defdelegate from_unix(timestamp, unit \\ :nanoseconds), to: DateTime

  defdelegate from_unix!(timestamp, unit \\ :nanoseconds), to: DateTime

  defdelegate strftime(term, format, lang \\ :en), to: Calendar.Strftime

  defdelegate strftime!(term, format, lang \\ :en), to: Calendar.Strftime
end
