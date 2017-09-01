defmodule Backpack.Inflex.Helpers do
  def to_upper_char(char) when char >= ?a and char <= ?z, do: char - 32
  def to_upper_char(char), do: char

  def to_lower_char(char) when char >= ?A and char <= ?Z, do: char + 32
  def to_lower_char(char), do: char
end
