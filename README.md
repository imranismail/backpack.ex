# Backpack

[![Hex Version](https://img.shields.io/hexpm/v/backpack.svg)](https://hex.pm/packages/backpack)

Conveniences and tools that I've used throughout my Elixir projects

## Installation

If [available in Hex](https://hex.pm/docs/publish), the package can be installed
by adding `backpack` to your list of dependencies in `mix.exs`:

```elixir
def deps do
  [
    {:backpack, "~> 0.2.0"}
  ]
end
```

## Includes
An ActiveSupport inspired way of handling dates and times.
### Moment



I'm well aware that [timex](https://github.com/bitwalker/timex) has some of these functions. However, I'm not a fan of [timex](https://github.com/bitwalker/timex) and usually use [calendar](https://github.com/lau/calendar) instead. I find it to be more performant when dealing with collections.

This module works best with [calendar](https://github.com/lau/calendar), infact it uses [calendar](https://github.com/lau/calendar) underneath for some of it's functions like `Moment.strftime/2` to have a uniformed API.

However you may also keep things simple and stick to just storing date/time in UTC using NaiveDateTime/DateTime/Date.

```elixir
iex(1)> use Backpack, :moment
Backpack.Moment

# It can work with integers and output to unix timestamp
iex(2)> 1 |> Moment.day() |> Moment.ago()
1504123763921954000
iex(3)> 1 |> Moment.day() |> Moment.ago() |> Moment.from_unix!()
#DateTime<2017-08-30 20:09:43.939502Z>

# There are helper functions for working with DateTime/NaiveDateTime/Date
iex(4)> DateTime.utc_now() |> Moment.days_from_now(3)
#DateTime<2017-09-03 16:21:18.028638Z>
iex(5)> NaiveDateTime.utc_now() |> Moment.weeks_from_now(3)
~N[2017-09-21 16:25:31.817088]
iex(6)> NaiveDateTime.utc_now() |> Moment.weeks_from_now(3) |> Moment.quarter()
3
iex(7)> DateTime.utc_now() |> Moment.weeks_from_now(3) |> Moment.beginning_of_quarter()
#DateTime<2017-07-01 00:00:00.000000Z>
iex(8)> DateTime.utc_now() |> Moment.add(years: 1, days: -1)
#DateTime<2018-08-30 16:28:55.900591Z>
iex(9)> DateTime.utc_now() |> Moment.yesterday() |> Moment.next_year()
#DateTime<2018-08-30 16:29:08.464739Z>
iex(10)> Date.utc_today() |> Moment.end_of_month()
~D[2017-08-31]

# Some operations may convert a Date to NaiveDateTime when necessary with Time starting from 00:00:00.00000
iex(11)> Date.utc_today() |> Moment.end_of_day()
~N[2017-08-31 23:59:59.999999]
iex(12)> Date.utc_today() |> Moment.add(days: 1, weeks: 1, months: 1, years: 1, minutes: 20)
~N[2018-10-08 00:20:00.000000]

# However, it wont convert to NaiveDateTime unless there are time units
iex(13)> Date.utc_today() |> Moment.add(days: 1, weeks: 1, months: 1, years: 1)
~D[2018-10-08]

# The implementations of the protocol for different data types can interoperate
iex(15)> DateTime.utc_now() |> Moment.ago(1 |> Moment.day())
#DateTime<2017-08-30 16:41:50.362824Z>
```

## Inflex

An ActiveSupport inspired way of handling strings.

Documentation can be generated with [ExDoc](https://github.com/elixir-lang/ex_doc)
and published on [HexDocs](https://hexdocs.pm). Once published, the docs can
be found at [https://hexdocs.pm/backpack](https://hexdocs.pm/backpack).

