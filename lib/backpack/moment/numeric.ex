defmodule Backpack.Moment.Numeric do
  def years(num, unit \\ :seconds) do
    System.convert_time_unit(num * 365 * 24 * 60 * 60, :seconds, unit)
  end

  def months(num, unit \\ :seconds) do
    System.convert_time_unit(num * 30 * 24 * 60 * 60, :seconds, unit)
  end

  def weeks(num, unit \\ :seconds) do
    System.convert_time_unit(num * 7 * 24 * 60 * 60, :seconds, unit)
  end

  def days(num, unit \\ :seconds) do
    System.convert_time_unit(num * 24 * 60 * 60, :seconds, unit)
  end

  def hours(num, unit \\ :seconds) do
    System.convert_time_unit(num * 60 * 60, :seconds, unit)
  end

  def minutes(num, unit \\ :seconds) do
    System.convert_time_unit(num * 60, :seconds, unit)
  end

  def seconds(num, unit \\ :seconds) do
    System.convert_time_unit(num, :seconds, unit)
  end
end
