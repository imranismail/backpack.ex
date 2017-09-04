defimpl Backpack.Moment.Converter, for: NaiveDateTime do
  def to_unix(term, unit) do
    term
    |> DateTime.from_naive!("Etc/UTC")
    |> DateTime.to_unix(unit)
  end
end
