defmodule Backpack.Inflex.Helpers do
  def to_upper_char(char) when char >= ?a and char <= ?z, do: char - 32
  def to_upper_char(char), do: char

  def to_lower_char(char) when char >= ?A and char <= ?Z, do: char + 32
  def to_lower_char(char), do: char

  def transform_unwanted_parameter_chars(<<head::utf8, tail::binary>>, char)
  when head not in [?-, ?_]
  and (head < ?A or head > ?Z)
  and (head < ?a or head > ?z)
  and (head < ?0 or head > 9) do
    char <> transform_unwanted_parameter_chars(tail, char)
  end
  def transform_unwanted_parameter_chars(<<head::utf8, tail::binary>>, char),
    do: <<head>> <> transform_unwanted_parameter_chars(tail, char)
  def transform_unwanted_parameter_chars("", _opts),
    do: ""
end
