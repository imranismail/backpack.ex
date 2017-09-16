defmodule Backpack.Moment.Presenter do
  @minutes_in_year 525600
  @minutes_in_quarter_year 131400
  @minutes_in_three_quarters_year 394200

  def time_ago_in_words(from, opts) do
    unit = Keyword.get(opts, :unit, :seconds)
    distance_of_time_in_words(from, Backpack.Moment.timestamp(unit), opts)
  end

  def distance_of_time_in_words(from, to, opts) do
    unit = Keyword.get(opts, :unit, :seconds)
    include_seconds = Keyword.get(opts, :include_seconds, false)
    from_time = Backpack.Moment.to_unix(from, unit)
    from_time = System.convert_time_unit(from_time, unit, :seconds)
    to_time = Backpack.Moment.to_unix(to, unit)
    to_time = System.convert_time_unit(to_time, unit, :seconds)
    [from_time, to_time] = if from_time > to_time, do: [to_time, from_time], else: [from_time, to_time]
    distance_in_minutes = round((to_time - from_time) / 60)
    distance_in_seconds = round(to_time - from_time)

    if distance_in_minutes <= 1 do
      if include_seconds do
        distance_in_seconds_to_words(distance_in_seconds)
      else
        "less than a minute"
      end
    else
      with :almost_2_years <- distance_in_minutes_to_words(distance_in_minutes) do
        minutes_with_offset = calculate_minutes_offset(from, to, distance_in_minutes)
        remainder = rem(minutes_with_offset, @minutes_in_year)
        distance_in_years = div(minutes_with_offset, @minutes_in_year)

        cond do
          remainder < @minutes_in_quarter_year ->
            "about #{distance_in_years} years"
          remainder < @minutes_in_three_quarters_year ->
            "over #{distance_in_years} years"
          true ->
            "almost #{distance_in_years + 1} years"
        end
      end
    end
  end

  defp distance_in_seconds_to_words(seconds) when seconds < 4,
    do: "less than 5 seconds"
  defp distance_in_seconds_to_words(seconds) when seconds < 9,
    do: "less than 10 seconds"
  defp distance_in_seconds_to_words(seconds) when seconds < 19,
    do: "less than 20 seconds"
  defp distance_in_seconds_to_words(seconds) when seconds < 39,
    do: "half a minute"
  defp distance_in_seconds_to_words(seconds) when seconds < 59,
    do: "less than a minute"
  defp distance_in_seconds_to_words(_seconds),
    do: "a minute"

  defp distance_in_minutes_to_words(minutes) when minutes < 45,
    do: "#{minutes} minutes"
  defp distance_in_minutes_to_words(minutes) when minutes < 90,
    do: "about an hour"
  defp distance_in_minutes_to_words(minutes) when minutes < 1440,
    do: "about #{round(minutes / 60)} hours"
  defp distance_in_minutes_to_words(minutes) when minutes < 2520,
    do: "a day"
  defp distance_in_minutes_to_words(minutes) when minutes < 43200,
    do: "#{round(minutes / 1440)} days"
  defp distance_in_minutes_to_words(minutes) when minutes < 86400,
    do: "about a month"
  defp distance_in_minutes_to_words(minutes) when minutes < 525600,
    do: "#{round(minutes / 43200)} months"
  defp distance_in_minutes_to_words(minutes) when minutes < 525600 + @minutes_in_quarter_year,
    do: "about a year"
  defp distance_in_minutes_to_words(minutes) when minutes < 525600 + @minutes_in_three_quarters_year,
    do: "over a year"
  defp distance_in_minutes_to_words(_minutes),
    do: :almost_2_years

  defp calculate_minutes_offset(%from_struct{} = from, %to_struct{} = to, distance_in_minutes)
  when from_struct in [DateTime, NaiveDateTime, Date]
  and to_struct in [DateTime, NaiveDateTime, Date] do
    from_year = from.year
    from_year = if from.month >= 3, do: from_year + 1, else: from_year
    to_year = to.year
    to_year = if to.month < 3, do: to_year - 1, else: to_year
    leap_years =
      if from_year > to_year do
        0
      else
        from_year..to_year
        |> Enum.filter(&Calendar.ISO.leap_year?/1)
        |> Enum.count()
      end

    minutes_offset_for_leap_year = leap_years * 1440
    # Discount the leap year days when calculating year distance.
    # e.g. if there are 20 leap year days between 2 dates having the same day
    # and month then the based on 365 days calculation
    # the distance in years will come out to over 80 years when in written
    # English it would read better as about 80 years.
    distance_in_minutes - minutes_offset_for_leap_year
  end
  defp calculate_minutes_offset(_from, _to, distance_in_minutes),
    do: distance_in_minutes
end
