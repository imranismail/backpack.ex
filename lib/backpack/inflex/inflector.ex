defmodule Backpack.Inflex.Inflector do
  import Backpack.Inflex.Helpers

  def camelize(term, uppercase_first_letter \\ true)

  def camelize(term, true),
    do: Macro.camelize(term)
  def camelize("", false),
    do: ""
  def camelize(<<?_, tail::binary>>, false),
    do: camelize(tail, false)
  def camelize(<<head, _tail::binary>> = term, false) do
    <<_head, tail::binary>> = camelize(term)
    <<to_lower_char(head)>> <> tail
  end

  def dasherize(""),
    do: ""
  def dasherize(<<?_, tail::binary>>),
    do: "-" <> dasherize(tail)
  def dasherize(<<head, tail::binary>>),
    do: <<head>> <> dasherize(tail)

  def underscore(term),
    do: Macro.underscore(term)

  def humanize(""),
    do: ""
  def humanize(<<?_, tail::binary>>),
    do: " " <> humanize(tail)
  def humanize(<<head, tail::binary>>),
    do: String.capitalize(<<head>> <> humanize(tail))

  def transliterate(term, replacement \\ "?", lang \\ :en)
  def transliterate("", _replacement, _lang),
    do: ""
  def transliterate(<<head::utf8, tail::binary>>, replacement, lang) when head < 128,
    do: <<head::utf8>> <> transliterate(tail, replacement, lang)
  def transliterate(<<head::utf8, tail::binary>>, replacement, lang) do
    transliterator = Backpack.Transliterator.get(lang)
    transliterator.transliterate(<<head::utf8>>, replacement) <>
      transliterate(tail, replacement, lang)
  end

  def parameterize(term, opts \\ []) do
    separator = Keyword.get(opts, :separator, "-")
    preserve_case? = Keyword.get(opts, :preserve_case, false)

    re_sep = Regex.escape(separator)
    re_duplicate_separator = ~r/#{re_sep}{2,}/
    re_leading_trailing_separator = ~r/^#{re_sep}|#{re_sep}$/i

    parameterized =
      term
      |> transliterate()
      |> String.replace(~r/[^a-z0-9\-_]+/i, separator, global: true)
      |> String.replace(re_duplicate_separator, separator, global: true)
      |> String.replace(re_leading_trailing_separator, "", global: true)

    if preserve_case? do
      parameterized
    else
      String.downcase(parameterized)
    end
  end
end
