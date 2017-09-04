defimpl Backpack.Moment.Converter, for: Date do
  def to_unix(term, unit) do
    {:ok, naive_datetime} = NaiveDateTime.new(term.year, term.month, term.day, 0, 0, 0)
    Backpack.Moment.Converter.to_unix(naive_datetime, unit)
  end
end
