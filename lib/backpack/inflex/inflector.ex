defmodule Backpack.Inflex.Inflector do
  import Backpack.Inflex.Helpers

  def camelize(term, uppercase_first_letter \\ true)

  def camelize(term, true),
    do: Macro.camelize(term)
  def camelize("", false),
    do: ""
  def camelize(<<?_, tail::binary>>, false),
    do: camelize(tail, false)
  def camelize(<<head::utf8, _tail::binary>> = term, false) do
    <<_head, tail::binary>> = camelize(term)
    <<to_lower_char(head)>> <> tail
  end

  def dasherize(""),
    do: ""
  def dasherize(<<?_, tail::binary>>),
    do: "-" <> dasherize(tail)
  def dasherize(<<head::utf8, tail::binary>>),
    do: <<head::utf8>> <> dasherize(tail)

  def underscore(term),
    do: Macro.underscore(term)

  def humanize(""),
    do: ""
  def humanize(<<?_, tail::binary>>),
    do: " " <> humanize(tail)
  def humanize(<<head::utf8, tail::binary>>),
    do: String.capitalize(<<head>> <> humanize(tail))

  def transliterate(term, replacement \\ "?", lang \\ :en)
  def transliterate("", _replacement, _lang),
    do: ""
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
      |> String.trim_leading(separator)
      |> String.trim_trailing(separator)

    if preserve_case? do
      parameterized
    else
      String.downcase(parameterized)
    end
  end

  def titleize(term) do
    <<head, tail::binary>> =
      term
      |> underscore()
      |> humanize()
      |> do_titleize()

    <<to_upper_char(head)>> <> tail
  end

  defp do_titleize(""),
    do: ""
  defp do_titleize(<<?\s, head, tail::binary>>),
    do: " " <> <<to_upper_char(head)>> <> do_titleize(tail)
  defp do_titleize(<<head::utf8, tail::binary>>),
    do: <<head>> <> do_titleize(tail)
end
