defmodule Backpack.Inflex.Inflector do
  import Backpack.Inflex.Helpers

  def camelize(term, uppercase_first_letter \\ true)

  def camelize(term, true),
    do: Macro.camelize(term)
  def camelize(<<>>, false),
    do: <<>>
  def camelize(term, false) do
    camelized = String.trim(term, "_")
    <<head, tail::binary>> = camelize(camelized)
    <<to_lower_char(head)>> <> tail
  end

  def underscore(<<h, t::binary>>) do
    <<to_lower_char(h)>> <> do_underscore(t, h)
  end
  def underscore("") do
    ""
  end

  defp do_underscore(<<h, t, rest::binary>>, _)
  when (h >= ?A and h <= ?Z)
  and not (t >= ?A and t <= ?Z)
  and t != ?. and t != ?_ do
    <<?_, to_lower_char(h), t>> <> do_underscore(rest, t)
  end
  defp do_underscore(<<h, t::binary>>, prev)
  when (h >= ?A and h <= ?Z)
  and not (prev >= ?A and prev <= ?Z)
  and prev != ?_ do
    <<?_, to_lower_char(h)>> <> do_underscore(t, h)
  end
  defp do_underscore(<<?., t::binary>>, _) do
    <<?/>> <> underscore(t)
  end
  defp do_underscore(<<?-, t::binary>>, _) do
    <<?_>> <> underscore(t)
  end
  defp do_underscore(<<h, t::binary>>, _) do
    <<to_lower_char(h)>> <> do_underscore(t, h)
  end
  defp do_underscore(<<>>, _) do
    <<>>
  end

  def dasherize(term),
    do: String.replace(term, "_", "-")

  def humanize(term, opts \\ []) do
    capitalize? = Keyword.get(opts, :capitalize, true)

    humanized =
      term
      |> String.trim("_")
      |> String.trim_trailing("_id")
      |> String.replace("_", " ")

    if capitalize? do
      String.capitalize(humanized)
    else
      humanized
    end
  end

  def transliterate(term, replacement \\ "?", lang \\ :en)
  def transliterate(<<>>, _replacement, _lang),
    do: <<>>
  def transliterate(<<head::utf8, tail::binary>>, replacement, lang) when head < 128,
    do: <<head>> <> transliterate(tail, replacement, lang)
  def transliterate(<<head::utf8, tail::binary>>, replacement, lang) do
    transliterator = Backpack.Transliterator.get(lang)
    transliterator.transliterate(<<head::utf8>>, replacement) <>
      transliterate(tail, replacement, lang)
  end

  def parameterize(term, opts \\ []) do
    preserve_case? = Keyword.get(opts, :preserve_case, false)
    separator = Keyword.get(opts, :separator, "-")
    regex_separator = Regex.escape(separator)

    parameterized =
      term
      |> transliterate()
      |> transform_unwanted_parameter_chars(separator)
      |> String.replace(~r/#{regex_separator}{2,}/, separator, global: true)
      |> String.trim(separator)

    if preserve_case? do
      parameterized
    else
      String.downcase(parameterized)
    end
  end

  def titleize(term) do
    term
    |> underscore()
    |> humanize()
    |> do_titleize()
  end

  defp do_titleize(<<?\s, head, tail::binary>>),
    do: <<?\s>> <> <<to_upper_char(head)>> <> do_titleize(tail)
  defp do_titleize(<<head, tail::binary>>),
    do: <<head>> <> do_titleize(tail)
  defp do_titleize(<<>>),
    do: <<>>
end
