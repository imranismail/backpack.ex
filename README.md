# Backpack

Conveniences and tools that I've used throughout my Elixir projects

## Installation

If [available in Hex](https://hex.pm/docs/publish), the package can be installed
by adding `backpack` to your list of dependencies in `mix.exs`:

```elixir
def deps do
  [
    {:backpack, "~> 0.1.0"}
  ]
end
```

## Includes

### Moment
An ActiveSupport inspired way of handling dates and times

```elixir
iex(1)> use Backpack, :moment
Backpack.Moment
iex(2)> 1 |> Moment.day() |> Moment.ago() |> Moment.from_unix!()
#DateTime<2017-08-30 16:18:36Z>
iex(3)> 2 |> Moment.days() |> Moment.from_now() |> Moment.from_unix!()
#DateTime<2017-09-02 16:20:20Z>
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
iex(11)> Date.utc_today() |> Moment.end_of_month()
~D[2017-08-31]
# Some operations may convert a Date to DateTime when necessary with Time starting from 00:00:00.00000
iex(12)> Date.utc_today() |> Moment.end_of_day()
~N[2017-08-31 23:59:59.999999]
iex(12)> Date.utc_today() |> Moment.end_of_day()
~N[2017-08-31 23:59:59.999999]
iex(13)> Date.utc_today() |> Moment.hours_from_now(3)
~N[2017-08-31 03:00:00.000000]
iex(14) DateTime.utc_today() |>
# The implementations of the protocol for different data types can interoperate
iex(15)> DateTime.utc_now() |> Moment.ago(1 |> Moment.day())
#DateTime<2017-08-30 16:41:50.362824Z>
```


Documentation can be generated with [ExDoc](https://github.com/elixir-lang/ex_doc)
and published on [HexDocs](https://hexdocs.pm). Once published, the docs can
be found at [https://hexdocs.pm/backpack](https://hexdocs.pm/backpack).

