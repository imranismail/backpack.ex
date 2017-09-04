defimpl Backpack.Moment.Converter, for: DateTime do
  defdelegate to_unix(term, unit), to: DateTime
end
