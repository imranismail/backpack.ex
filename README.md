# Backpack

[![Hex Version](https://img.shields.io/hexpm/v/backpack.svg)](https://hex.pm/packages/backpack)

Conveniences and tools that I've used throughout my Elixir projects

## Installation

If [available in Hex](https://hex.pm/docs/publish), the package can be installed
by adding `backpack` to your list of dependencies in `mix.exs`:

```elixir
def deps do
  [
    {:backpack, "~> 0.3.0"}
  ]
end
```

## Includes

### Moment

An ActiveSupport inspired way of handling dates and times.

#### Disclaimer

I'm well aware that [timex](https://github.com/bitwalker/timex) has some of these functions. However, I'm not a fan of [timex](https://github.com/bitwalker/timex) and usually use [calendar](https://github.com/lau/calendar) instead. I find it to be more performant when dealing with collections.

This module works best with [calendar](https://github.com/lau/calendar), infact it uses [calendar](https://github.com/lau/calendar) underneath for some of it's functions like `Moment.strftime/2` to have a uniformed API.

However you may also keep things simple and stick to just storing date/time in UTC using NaiveDateTime/DateTime/Date.

```elixir
iex(1)> alias Backpack.Moment
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

### Inflex

An ActiveSupport inspired way of handling strings built using binary pattern matching.

Regex is always avoided unless needed.

```elixir
iex(1)> alias Backpack.Inflex
Backpack.Inflex

# Camelize
iex(2)> Inflex.camelize("iron_man")
"IronMan"
iex(3)> Inflex.camelize("iron_man", :lower)
"ironMan"
iex(3)> Inflex.camelize("iron_man/avenger")
"IronMan.Avenger"
iex(4)> Inflex.camelize("iron_man/avenger", :lower)
"imranIsmail.Avenger"

# Underscore
iex(5)> Inflex.underscore("IronMan")
"iron_man"
iex(6)> Inflex.underscore("IronMan.Avenger")
"iron_man/avenger"

# Dasherize
iex(7)> Inflex.dasherize("iron_man")
"iron-man"
iex(8)> Inflex.dasherize("iron_man")
"iron-man"

# Humanize
iex(8)> Inflex.humanize("iron_man")
"Imran ismail"
iex(9)> Inflex.humanize("user_id")
"User"
iex(10)> Inflex.humanize("user_id", capitalize: false)
"user"
iex(11)> Inflex.humanize("_id")
"Id"

# Transliterate
# It's pretty basic right now, but I'm working on integrating Unicode's CLDR
# Need some help on this, ping me if you have experience doing this
iex(12)> Inflex.transliterate("Ærøskøbing")
"AEroskobing"

# Parameterize
iex(12)> Inflex.parameterize("Donald E. Knuth")
"donald-e-knuth"
iex(13)> Inflex.parameterize("Ærøskøbing.-Ærøskøbing")
"aeroskobing-aeroskobing"
iex(14)> Inflex.parameterize("Donald E. Knuth", preserve_case: true)
"Donald-E-Knuth"
iex(15)> Inflex.parameterize("Donald E. Knuth", separator: "_")
"donald_e_knuth"

# Titleize
iex(15)> Inflex.titleize("man from the boondocks")
"Man From The Boondocks"
iex(16)> Inflex.titleize("x-men: the last stand")
"X Men: The Last Stand"
iex(17)> Inflex.titleize("TheManWithoutAPast")
"The Man Without A Past"
iex(18)> Inflex.titleize("raiders_of_the_lost_ark")
"Raiders Of The Lost Ark"
```

## References
- [Phoenix.Naming](https://hexdocs.pm/phoenix/Phoenix.Naming.html)
- [ActiveSupport](https://github.com/wycats/rails-api/blob/master/vendor/rails/activesupport/lib/active_support/)
- [Macro](https://hexdocs.pm/elixir/Macro.html)
